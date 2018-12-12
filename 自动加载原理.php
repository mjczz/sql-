<?php 
// 您也可以通过注册自动加载器功能在不使用Composer的情况下使用Fractal
spl_autoload_register(
    function($class) {
        // 类库命名空间
        $prefix = 'League\\Fractal\\';

        // 类库所在根目录
        //$base_dir = __DIR__ . '/src/';
        $base_dir = __DIR__ . '/vendor/league/fractal/src/';

        // 比较是否是可自动加载的类库
        $len = strlen($prefix);
        if (strncmp($prefix, $class, $len) !== 0) {
            // no, move to the next registered autoloader
            return;
        }

        // 截取类名（文件名)
        $relative_class = substr($class, $len);
        // 类文件绝对路径
        $file = $base_dir . str_replace('\\', '/', $relative_class) . '.php';
        // 文件存在，引入类库
        if (file_exists($file)) {
            require $file;
        }
    }
);