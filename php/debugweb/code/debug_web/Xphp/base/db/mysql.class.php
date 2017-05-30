<?php
/*mysql.class*/
class Xmysql{
    protected $conn;//数据库连接对象
    protected $serverType;//数据库类型
    protected $serverHost;//数据库IP地址
    protected $userName;//数据库用户名
    protected $password;//数据库密码
    protected $dbName;//数据库名字
    protected $tableFex;//表前缀
    protected $columnFex;//字段前缀

    /**
     * 连接数据库
     * @throws Exception 连接失败
     */
    public function connect(){
        $this->serverHost=config("DB_HOST");
        $this->userName=config("DB_USER");
        $this->password=config("DB_PASS");
        $this->dbName=config("DB_NAME");
        $this->tableFex=config("TABLE_PREFIX");
        $this->columnFex=config("COLUMN_PREFIX");
        $this->conn = new PDO("mysql:host=".$this->serverHost.";dbname=".$this->dbName, $this->userName, $this->password);
        $this->conn->exec("SET NAMES ".config("DB_CODE"));
        if(!$this->conn){
            throw new Exception("connect wrong!");
        }
    }

    /**
     * 关闭连接
     */
    public function close(){
        $this->link=null;
    }

    /**
     * 插入数据
     * @param $tableName  数据表的名字
     * @param $paramArray 参数map
     * @throws Exception 插入失败抛异常
     * @return mixed 返回一个PDOStatement
     */
    public function insert($tableName ,$paramArray){
        $sql = "INSERT INTO ".$this->tableFex.$tableName." (";
        $sqlLater = ") VALUES (";
        foreach($paramArray as $key => $value){
            $sql = $sql.$this->columnFex.$key.", ";
            $sqlLater = $sqlLater.":".$key.", ";
        }
        $sql = substr($sql,0,strlen($sql)-2).substr($sqlLater,0,strlen($sqlLater)-2).")";
        return $this->conn->prepare($sql);
    }

    /**
     * 执行查询语句
     * @param $tableName 数据表的名字
     * @param $resParams 返回的参数名
     * @param $sqlWhere 查询条件语句
     * @return mixed 返回一个PDOStatement
     */
    public function select($tableName, $resParams, $sqlWhere=""){
        $sql = "SELECT ";
        foreach($resParams as $param){
            if($param!="*"){
                $sql = $sql.$this->columnFex.$param.", ";
            }else{
                $sql = $sql.$param.", ";
            }
        }
        $sql = substr($sql,0,strlen($sql)-2)." FROM ".$this->tableFex.$tableName." ".$sqlWhere;
        sysout($sql);
        return $this->conn->prepare($sql);
    }

    /**
     * 执行删除语句
     * @param $tableName 数据表的名字
     * @param $sqlWhere 删除条件语句
     * @return mixed 返回一个PDOStatement
     */
    public function delete($tableName, $sqlWhere=""){
        $sql = "DELETE FROM ".$this->tableFex.$tableName." ".$sqlWhere;
        return $this->conn->prepare($sql);
    }

    /**
     * 执行更新语句
     * @param $tableName 数据表的名字
     * @param $paramArray 更新的参数名和参数值得键值对
     * @param $sqlWhere 更新条件语句
     * @return mixed 返回一个PDOStatement
     */
    public function update($tableName, $paramArray, $sqlWhere=""){
        $sql = "UPDATE ".$this->tableFex.$tableName." SET ";
        foreach($paramArray as $key=>$value){
            if($value=='?'||substr($value,0,1)==":"){
                $sql=$sql.$this->columnFex.$key."=".$value.", ";
            }else{
                $sql=$sql.$this->columnFex.$key."=".":".$key.", ";
            }
        }
        $sql=substr($sql,0,strlen($sql)-2)." ".$sqlWhere;
        return $this->conn->prepare($sql);
    }

    /**
     * 生成条件语句
     * @param $paramArray 条件语句中参数键值对 此键值对中值可以使用‘>’,‘>=’,‘<’,‘<=’,‘=’,‘!=’等符号，
     * 如果不带这些符号则默认为‘=’，如果参数值本身为这些符号，则需要在otherSql中写了
     * @param string $otherSql 非此函数自动生成的sql语句 （包括and）
     * @return string  生成的sql语句
     */
    public function sqlWhere($paramArray, $otherSql=""){
        $sql = "WHERE ";
        foreach($paramArray as $key=>$value){
            $sign="=";
            if(substr($value,0,2)==">="||substr($value,0,2)=="<="||substr($value,0,2)=="!="){
                $sign=substr($value,0,2);
                $value=substr($value,2);
            }else if(substr($value,0,1)==">"||substr($value,0,1)=="<"||substr($value,0,1)=="="){
                $sign=substr($value,0,1);
                $value=substr($value,1);
            }
            $sql = $sql.$this->columnFex.$key.$sign."'".$value."'"." AND ";
        }
        $sql = substr($sql,0,strlen($sql)-5);
        if($otherSql!=""){
            $sql = $sql.$otherSql;
        }
        return $sql;
    }

    /**
     * 生成条件语句
     * @param $paramArray 条件语句中参数键值对 此键值对中值可以使用‘>’,‘>=’,‘<’,‘<=’,‘=’,‘!=’等符号，
     * 如果不带这些符号则默认为‘=’，如果参数值本身为这些符号，则需要在otherSql中写了
     * @param string $otherSql 非此函数自动生成的sql语句 （包括and）
     * @return string  生成的sql语句
     */
    public function paramSqlWhere($paramArray, $otherSql=""){
        $sql = "WHERE ";
        foreach($paramArray as $key=>$value){
            $sign="=";
            if(substr($value,0,2)==">="||substr($value,0,2)=="<="||substr($value,0,2)=="!="){
                $sign=substr($value,0,2);
            }else if(substr($value,0,1)==">"||substr($value,0,1)=="<"||substr($value,0,1)=="="){
                $sign=substr($value,0,1);
            }
            $sql = $sql.$this->columnFex.$key.$sign.":".$key." AND ";
        }
        $sql = substr($sql,0,strlen($sql)-5);
        if($otherSql!=""){
            $sql = $sql.$otherSql;
        }
        sysout($sql);
        return $sql;
    }

    /**
     * statement根据参数名绑定参数
     * @param null $stmt PDOStatement
     * @param array $data 绑定参数的键值对
     * @return max PDOStatement
     */
    public function getBindStmt($stmt=null, $data=array()){
        if($stmt==null){
            return;
        }
        foreach($data as $key=>$value){
            if(substr($value,0,2)==">="||substr($value,0,2)=="<="||substr($value,0,2)=="!="){
                $value=substr($value,2);
            }else if(substr($value,0,1)==">"||substr($value,0,1)=="<"||substr($value,0,1)=="="){
                $value=substr($value,1);
            }
            $key=":".$key;
            sysout($key."->".$value);
            $stmt->bindValue($key, $value,PDO::PARAM_LOB);
        }
        return $stmt;
    }

    /**
     * 处理查询结果
     * @param $stmt
     * @return array 查询结果
     */
    public function getResult($stmt){
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_CLASS);
        $newResults = array();
        $len = strlen($this->columnFex);
        for($i=0; $i<count($results); $i++){
            sysout($i);
            $result = (array)$results[$i];
            $newRes = array();
            foreach($result as $key=>$value){
                $key = substr($key, $len);
                $newRes[$key] = $value;
            }
            $newResults[$i] = $newRes;
        }
        return $newResults;
    }
}

?>