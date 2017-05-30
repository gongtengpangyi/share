<?php
/*app.class */
class Xapp
{
    /*
     * 开始应用
     */
    public function start(){
        controller(get("controller"),get("action"));
    }

}