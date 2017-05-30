<?php
/*model.class*/
class Xmodel
{
    /*
     * 类名
     */
    protected $className;

    /*
     * 对应的表名
     */
    protected $tableName;

    /*
     * 对应的数据库操作对象
     */
    protected $db;

    /*
     * 编号
     */
    protected $id;

    /*
     * 参数数组（除id外）
     */
    protected $params;

    /**
     * Xmodel constructor.
     * @param array $params 参数数组
     * @param mixed $db 数据库对象
     */
    public function __construct($params=array(), $db=null) {
        $this->setParams($params);
        if($db==null){
            $dbType = config("DB_TYPE");
            require_file(X_DIR."/base/db/".$dbType.".class.php");
            $class_name="X".$dbType;
            $this->db = new $class_name();
            $this->db->connect();
        }else{
            $this->db = $db;
        }
    }

    /**
     * 清空参数
     */
    public function delParams(){
        $this->params=array();
    }

    /**
     * 设定某参数组
     * @param $params 参数数组
     */
    public function setParams($params){
        foreach($params as $key=>$value){
            $this->setParam($key, $value);
        }
    }

    /**
     * 获得参数数组
     * @return mixed 参数数组
     */
    public function getParams(){
        $array=$this->params;
        $array["id"]=$this->id;
        return $array;
    }

    /**
     * 设定某参数值
     * @param $key 参数名
     * @param $value 参数值
     */
    public function setParam($key, $value){
        if($key=="id"){
            $this->id = $value;
        }else{
            $this->params[$key] = $value;
        }
    }

    /**
     * 获得某参数值
     * @param $key 参数名
     * @return mixed 参数值
     */
    public function getParam($key){
        if($key=="id"){
            return $this->id;
        }else{
            return $this->params[$key];
        }
    }

    /**
     * 打印参数
     */
    public function printParams(){
        Xlog::write("id: ".$this->id, Xlog::INFO);
        foreach($this->params as $key=>$value){
            Xlog::write($key.": ".$value, Xlog::INFO);
        }
    }

    /**
     * 保存现有数据
     */
    public function save()
    {
        $stmt=$this->db->insert($this->tableName, $this->params);
        $stmt=$this->db->getBindStmt($stmt, $this->params);
        $stmt->execute();
        $this->findByParams($this->params," ORDER BY ".config("COLUMN_PREFIX")."id DESC ");
    }

    /**
     * 删除此条数据（根据id）
     */
    public function delete(){
        $stmt = $this->db->delete($this->tableName, $this->db->sqlWhere(array("id" => $this->id)));
        $stmt->execute();
    }

    /**
     * 更新此条数据（根据id）
     */
    public function update(){
        $stmt = $this->db->update($this->tableName, $this->params, $this->db->sqlWhere(array("id" => $this->id)));
        $stmt=$this->db->getBindStmt($stmt, $this->params);
        $stmt->execute();
    }

    /**
     * 查找所有
     * @return mixed 结果model集
     */
    public function findAll(){
        $stmt = $this->db->select($this->tableName, array("*"));
        $results = $this->db->getResult($stmt);
        $models = array();
        foreach($results as $result){
            $model = model($this->className,$result, $this->db);
            array_push($models, $model);
        }
        return $models;
    }

    /**
     * 根据参数查找
     * @param $params 参数键值对
     * @param string $otherSql 其他语句
     * @return mixed 结果models
     */
    public function findManyByParams($params, $otherSql=""){
        $stmt = $this->db->select($this->tableName, array("*"), $this->db->paramSqlWhere($params, $otherSql));
        $stmt = $this->db->getBindStmt($stmt, $params);
        $results = $this->db->getResult($stmt);
        $models = array();
        foreach($results as $result){
            $model = model($this->className,$result, $this->db);
            array_push($models, $model);
        }
        return $models;
    }

    /**
     * 根据参数查找
     * @param $params 参数键值对
     * @param string $otherSql 其他语句
     * @return mixed 结果model
     */
    public function findByParams($params, $otherSql=""){
        $stmt = $this->db->select($this->tableName, array("*"), $this->db->paramSqlWhere($params, $otherSql));
        $stmt = $this->db->getBindStmt($stmt, $params);
        $results = $this->db->getResult($stmt);
        if(!count($results)){
            return null;
        }
        $this->setParams($results[0]);
        return $this;
    }

    /**
     * 根据id查找
     * @return mixed 结果model
     */
    public function findById(){
        return $this->findByParams(array("id" => $this->id));
    }

}