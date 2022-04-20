/*
 Navicat Premium Data Transfer

 Source Server         : MySQL_3306
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : blog_db

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 20/04/2022 16:45:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article_pv_tbl
-- ----------------------------
DROP TABLE IF EXISTS `article_pv_tbl`;
CREATE TABLE `article_pv_tbl`  (
  `id` int(30) NOT NULL,
  `views` int(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_pv_tbl
-- ----------------------------
INSERT INTO `article_pv_tbl` VALUES (356922, 3677);
INSERT INTO `article_pv_tbl` VALUES (770235, 4322);
INSERT INTO `article_pv_tbl` VALUES (1647505781, 4209);
INSERT INTO `article_pv_tbl` VALUES (1647505912, 1100);
INSERT INTO `article_pv_tbl` VALUES (1647505976, 866);

-- ----------------------------
-- Table structure for article_star_tbl
-- ----------------------------
DROP TABLE IF EXISTS `article_star_tbl`;
CREATE TABLE `article_star_tbl`  (
  `id` int(30) NOT NULL,
  `star` int(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_star_tbl
-- ----------------------------
INSERT INTO `article_star_tbl` VALUES (356922, 233);
INSERT INTO `article_star_tbl` VALUES (770235, 221);
INSERT INTO `article_star_tbl` VALUES (1647505781, 145);
INSERT INTO `article_star_tbl` VALUES (1647505912, 89);
INSERT INTO `article_star_tbl` VALUES (1647505976, 66);

-- ----------------------------
-- Table structure for article_tbl
-- ----------------------------
DROP TABLE IF EXISTS `article_tbl`;
CREATE TABLE `article_tbl`  (
  `id` int(30) NULL DEFAULT NULL,
  `author` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tag` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` int(10) NULL DEFAULT NULL,
  `month` int(10) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_tbl
-- ----------------------------
INSERT INTO `article_tbl` VALUES (770235, 'admin', 'Flask 蓝图（blueprint）', '## 1. 一个最小的应用\n\nflask教程都喜欢用一个非常小的应用示例向你展示flask的小巧灵活，例如下面的这个应用\n\n```python\nfrom flask import Flask\n\napp = Flask(__name__)\n\n\n@app.route(\'/\')\ndef hello_world():\n    return \'Hello World!\'\n\n\nif __name__ == \'__main__\':\n    app.run(port=5678)\n```\n\n真正的flask应用，绝不可能是如此的短小，而是划分许多模块，要提供很多功能。\n\n\n\n## 2. 一个稍大点的flask应用\n\n下面的flask应用里，有一个user模块专门提供和用户有关的功能，例如用户注册，登录，登出，修改密码。还有一个admin模块，用来做后台管理，本示例只是为了向你展示如何在一个脚本里编写所有的模块，因此这些[视图函数](https://www.zhihu.com/search?q=视图函数&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={\"sourceType\"%3A\"article\"%2C\"sourceId\"%3A357444025})并没有具体的实现。\n\n```python\nfrom flask import Flask\napp = Flask(__name__)\n\n\n@app.route(\'/\')\ndef hello_world():\n    return \'Hello World!\'\n\n\n# user模块\n@app.route(\'/user/register\')\ndef register():\n    return \'register\'\n\n@app.route(\'/user/login\')\ndef login():\n    return \'login\'\n\n@app.route(\'/user/modify_password\')\ndef modify_password():\n    return \'modify_password\'\n\n\n# admin模块\n@app.route(\'/admin/alluser\')\ndef alluser():\n    return \'alluser\'\n\n\n@app.route(\'/admin/deluser\')\ndef deluser():\n    return \'deluser\'\n\n\n\nif __name__ == \'__main__\':\n    app.run(port=5678)\n```\n\n和最小的flask应用相比，这个应用多了两个模块，5个视图函数，这仍然是一个非常小的flask应用。在实践项目中，子模块和视图函数会非常的多，因此，不可能将他们都写在同一个脚本里，那样的话，这个脚本会非常的大，难以维护。\n\n\n\n## 3. BluePrint [蓝图技术](https://www.zhihu.com/search?q=蓝图技术&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={\"sourceType\"%3A\"article\"%2C\"sourceId\"%3A357444025})\n\n蓝图技术，可以帮助你实现flask应用的模块划分，对于没有亲身经历过大项目的人来说，很难理解模块划分的好处，换一种阐述方式，没有经历过大项目的人，根本不知道不划分模块或者模块划分不合理所带来的麻烦。\n\n我将第2小节的应用划分出两个模块，划分后，项目结构不再是一个单一的脚本，一个模块拥有一个属于自己的文件目录，与之相关的代码都将写在这里，项目结构如下：\n\n```text\nblue-example/\n├── admin\n│   ├── __init__.py\n│   └── views.py\n├── app.py\n└── user\n    ├── __init__.py\n    └── views.py\n```\n\n接下来，展示这些脚本里的内容\n\n\n\n### 3.1 [app.py](https://link.zhihu.com/?target=http%3A//app.py/)\n\n```python\nfrom flask import Flask\napp = Flask(__name__)\n\n\n@app.route(\'/\')\ndef hello_world():\n    return \'Hello World!\'\n\n\n\nfrom admin import admin_blue\nfrom user import user_blue\n\napp.register_blueprint(admin_blue)\napp.register_blueprint(user_blue)\n\n\n\nif __name__ == \'__main__\':\n    app.run(port=5678)\n```\n\n[app.py](https://link.zhihu.com/?target=http%3A//app.py/) 明显瘦身了，代码看起来干净整洁\n\n\n\n### 3.2 user模块\n\n**user/init.py**\n\n```python\nfrom flask import Blueprint\n\nuser_blue = Blueprint(\'user\', __name__, url_prefix=\'/user\')\nfrom . import views\n```\n\n**user/views.py**\n\n```python\nfrom user import user_blue\n\n\n# user模块\nfrom user import user_blue\n\n\n# user模块\n@user_blue.route(\'/register\')\ndef register():\n    return \'register\'\n\n@user_blue.route(\'/login\')\ndef login():\n    return \'login\'\n\n@user_blue.route(\'/modify_password\')\ndef modify_password():\n    return \'modify_password\'\n```\n\n\n\n### 3.3 admin\n\n**admin/init.py**\n\n```python\nfrom flask import Blueprint\n\n\nadmin_blue = Blueprint(\'admin\', __name__, url_prefix=\'/admin\')\nfrom . import views\n```\n\n**admin/views.py**\n\n```python\nfrom admin import admin_blue\n\n\n# admin模块\n@admin_blue.route(\'/alluser\')\ndef alluser():\n    return \'alluser\'\n\n\n@admin_blue.route(\'/deluser\')\ndef deluser():\n    return \'deluser\'\n```\n\n第3小节的[项目代码](https://www.zhihu.com/search?q=项目代码&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={\"sourceType\"%3A\"article\"%2C\"sourceId\"%3A357444025})，多了一些模块的划分，自然也多了一些文件目录，而且咋看起来，比第2小节的代码变复杂了些，但这种“复杂”是值得的， 它换来了整个项目清晰的结构，很好的控制了单个脚本的代码规模。\n\n\n\n## 4. 两种代码组织形式\n\n蓝图在组织[flask代码](https://www.zhihu.com/search?q=flask代码&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={\"sourceType\"%3A\"article\"%2C\"sourceId\"%3A357444025})时，有两种形式\n\n1. 功能式架构\n2. [分区式架构](https://www.zhihu.com/search?q=分区式架构&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={\"sourceType\"%3A\"article\"%2C\"sourceId\"%3A357444025})\n\n前面所展示的就是[功能式架构](https://www.zhihu.com/search?q=功能式架构&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={\"sourceType\"%3A\"article\"%2C\"sourceId\"%3A357444025})，一个功能，一个模块组织成一个蓝图，他们共用相同的静态资源，静态资源放在static目录下，本文所举实例太简单，因此没有创建静态资源，功能式架构类似于下面的结构\n\n```text\n__init__.py\nstatic/\ntemplates/\n    home/\n    control_panel/\n    admin/\nviews/\n    __init__.py\n    home.py\n    control_panel.py\n    admin.py\nmodels.py\n```\n\nhome, control_panel,admin 都是蓝图，他们共用static和 templates。\n\n分区式架构，适用于子模块有特殊需要的情况，在创建蓝图构造Blueprint对象时，可以指定static和templates， 其结构类似于下面这样\n\n```python\nyourapp/\n    __init__.py\n    admin/\n        __init__.py\n        views.py\n        static/\n        templates/\n    home/\n        __init__.py\n        views.py\n        static/\n        templates/\n    control_panel/\n        __init__.py\n        views.py\n        static/\n        templates/\n    models.py\n```\n\n试想，如果admin, home， control_panel有各自不同的页面样式和风格，那么他们就需要不同的静态资源，css, javascript,每个模块拥有各自的静态资源就是一个合理的选择。这样组织，还有一个好处，一个模块，或者说一个蓝图拥有自身全部的资源，包括static和templates，那么它可以很容易从一个项目里拆分出来放在另一个项目中使用。\n\n具体使用哪种组织架构，并没有强制要求，完全是开发人员随心所欲的，重要的是从项目管理的角度出发，哪一种更利于你所项目的管理，就用哪一种。', 'Python', '2022-03-17', 2022, 3);
INSERT INTO `article_tbl` VALUES (356922, 'tom', 'Java排序方法', '## Java排序方法\n\n#### 冒泡排序\n\n1. 相邻记录，反序则交换，if(a[j]>a[j+1])\n2. 冒泡排序每一趟都能把一个数送到最终位置【最大(向前向后），最小(从后向前)】\n3. 时间复杂度：平均o(n*n),最坏的情况：n-1+n-2+n-3....+1=n(n-1)/2，最好的情况：比较n-1次，交换0次o(n)\n4. 冒泡排序法受初始序列的影响\n5. 空间复杂度：o(1)\n6. 冒泡排序是稳定的【相同关键字在比较过程中不会发生前后位置交换】\n\n```java\nfor(i=1;i<n;i++){\n    for(j=0;j<n-i;j++)\n        if(a[j]>a[i]){\n            t=a[j];\n            a[j]=a[j+1];\n            a[j+1]=t;\n        }  \n}\n```\n\n\n\n#### 快速排序\n\n1. 枢轴：序列的第一个数当作枢轴先提出，i从前向后，j从后向前，都与枢轴比，j对应的数小于枢轴则提到i处，i对应的数大于枢轴则提到j处，i，j相遇则将枢轴值填入\n2. 每一次会把当前序列中的一个数送到最终位置【枢轴】\n3. 时间复杂度：o(log₂n)，原始有序时间复杂度最差：o(n² )\n4. 快速排序时间受初始序列影响（初始有序，反倒最差）\n5. 空间复杂度：o(log₂n)\n6. 稳定性：不稳定\n\n\n\n#### 选择排序\n\n1. 第i躺选当第i小的值，放到第i个位置【求最小值】\n\n2. 时间复杂度o(n²)\n\n3. 选择排序每一趟都能把一个值送到最终位置，从待排序序列中选择一个最小值放到已排序序列的末尾\n\n4. 选择排序时间不受初始序列影响，恒为o(n²)\n\n5. 空间复杂度：交换时用一个空间o(1)\n\n6. 选择排序不稳定\n\n   ```java\n   for(i=0;i<n-1;i++){\n       k=i;\n       for(j=i+1;j<n;j++){\n           if(a[j]<a[k])\n               k=j;\n           if(k!=i){\n               t=a[i];\n               a[i]=a[k];\n               a[k]=t;\n           }\n       }\n   }\n   ```\n\n   \n\n#### 插入排序\n\n   1. 直接插入排序\n\n      （1）基本思想：将一个待排序记录插入到一个有序子序列中依然保持有序。\n\n      （2）最后一次排序开始之前有可能所有的元素都不在最终位置上，也就是说插入排序并不保证每一趟都		  把一个元素送到最终位置上\n      （3）插入排序最好的情况下：数据已经按要求有序，比较n-1次，不发生移动o(n)\n      		  最坏的情况下：数据全部反序，需要比较n(n-1)/2，移动n(n-1)/2，o(n²)\n\n      （4）插入排序受数据初始序列的影响，数据基本有序的时候用插入排序最好。\n      （5）空间复杂度：o(1)\n      （6）稳定性：稳定\n\n      \n\n#### 希尔排序\n\n1. 分组插入排序，逐渐合并分组后再插入排序\n2. 稳定性：不稳定\n\n\n\n#### 归并排序\n\n1. 两个有序子序列合并成一个有序子序列\n2. 归并排序每一趟都要进行n次赋值，进行log₂n躺，所以时间复杂度恒o(log₂n)\n3. 最后一次排序开始之前有可能所有的元素都不在最终位置上，也就是说归并排序并不保证每一趟都把一个元素送到最终位置\n4. 空间复杂度：o(n)\n5. 稳定性：稳定\n\n\n\n#### 堆排序【选择类排序】\n\n1. 基本思想：树形选择排序的一个变形，使用一种堆的概念\n\n2. 大根堆【从小到大排序】任意一个非叶子结点的值都大于其左右孩子的值，\n\n   小根堆【从大到小排序】任意一个非叶子结点的值都小于其左右孩子的值，\n\n3. 时间复杂度：初始建堆+n-2次调整堆时间，恒为o(log₂n)\n\n4. 空间复杂度：o(1)交换用的一个空间\n\n5. 每趟都会把一个元素送到最终位置\n\n6. 不受初始序列的影响\n\n7. 不稳定\n\n\n\n#### 基数排序【桶】\n\n1. 基本思想：按数值的各位进行桶的分配，之后收集成一组，再按十位分配桶，再收集，再按百位分配收集，依次进行\n2. 位数为d，基数(桶数)\n\n\n\n#### 总结：\n\n不稳定排序：快速排序，选择排序，堆排序，希尔排序\n\n稳定排序：冒泡排序，直接插入排序，归并排序，基数排序\n\n时间复杂度受初始序列影响：快速排序，希尔排序，直接插入排序，冒泡排序\n\n每次排序都能使一个元素到达最终位置：快速排序，选择排序(最小)，堆排序(最大)，冒泡排序(大泡沉底)\n\n平均性能最好的是：快速排序\n\n空间复杂度最大的是：归并排序\n\n基本有序时选：插入排序\n\n数据有序反而更差的是：快速排序\n\n \n\n\n\n\n\n', 'Java', '2022-03-16', 2022, 3);
INSERT INTO `article_tbl` VALUES (1647505781, 'admin', 'MySQL教程', '# MySQL教程\n\n\n## 一，查询数据\n\n### 1. select查询\n\n```sql\nselect * from database;\n\nselect * from database limit 2;\n\nselect name,sex from student;\n\n\n\n```\n\nSELECT语句由以下列表中所述的几个子句组成：\n\n- `SELECT`之后是逗号分隔列或星号(*)的列表，表示要返回所有列。\n\n- `FROM`指定要查询数据的表或视图。\n- `JOIN`根据某些连接条件从其他表中获取数据。\n- `WHERE`过滤结果集中的行。\n- `GROUP BY`将一组行组合成小分组，并对每个小分组应用聚合函数。\n- `HAVING`过滤器基于GROUP BY子句定义的小分组。\n- `ORDER BY`指定用于排序的列的列表。\n- `LIMIT`限制返回行的数量。\n\n 语句中的`SELECT`和`FROM`语句是必须的，其他部分是可选的。 \n\n\n\n\n\n### 2. where子句\n\n `WHERE`子句允许根据指定的过滤表达式或条件来指定要选择的行。 \n\n```mysql\nselect local,area from house where city=\'北京\' limit 5;\n```\n\n即使`WHERE`子句出现在语句的末尾，但MySQL会首先使用`WHERE`子句中的表达式来选择匹配的行。它选择具有职位名称为销售代表的行记录。\n\n\n\nMySQL从`SELECT`子句中的选择列表中选择列。\n\n可以像上面的查询一样形成一个简单的条件，或者是将多个表达式与逻辑运算符(如AND，OR等)组合在一起的一个非常复杂的例子。例如，要在办公室代码(`officeCode`)等于`1`中查找所有销售代表，请使用以下查询：\n\n```sql\nSELECT \n    lastname, firstname, jobtitle\nFROM\n    employees\nWHERE\n    jobtitle = \'Sales Rep\' AND officeCode = 1;\n```\n\n\n\n下表列出了可用于在`WHERE`子句中形成过滤表达式的比较运算符。\n\n| 操作符       | 描述                                    |\n| ------------ | --------------------------------------- |\n| `=`          | 等于，几乎任何数据类型都可以使用它。    |\n| `<>` 或 `!=` | 不等于                                  |\n| `<`          | 小于，通常使用数字和日期/时间数据类型。 |\n| `>`          | 大于，                                  |\n| `<=`         | 小于或等于                              |\n| `>=`         | 大于或等于                              |\n\n\n\n## 二，插入数据\n\n### 1. 简单的INSERT语句\n\nMySQL `INSERT`语句用于将一行或多行插入到表中。下面说明了`INSERT`语句的语法：\n\n```sql\nINSERT INTO table(column1,column2...)\nVALUES (value1,value2,...);\nSQL\n```\n\n**首先**，在`INSERT INTO`子句之后，在括号内指定表名和逗号分隔列的列表。\n**然后**，将括号内的相应列的逗号分隔值放在`VALUES`关键字之后。\n\n在执行插入语句前，需要具有执行`INSERT`语句的`INSERT`权限。\n让我们创建一个名为`tasks`的新表来练习`INSERT`语句，参考以下创建语句 \n\n```mysql\nUSE testdb;\n\nCREATE TABLE IF NOT EXISTS tasks (\n    task_id INT(11) AUTO_INCREMENT,\n    subject VARCHAR(45) DEFAULT NULL,\n    start_date DATE DEFAULT NULL,\n    end_date DATE DEFAULT NULL,\n    description VARCHAR(200) DEFAULT NULL,\n    PRIMARY KEY (task_id)\n)ENGINE=InnoDB DEFAULT CHARSET=utf8;\n\n```\n\n例如，如果要将任务插入到`tasts`表中，则使用`INSERT`语句如下：\n\n```sql\nINSERT INTO tasks(subject,start_date,end_date,description)\nVALUES(\'Learn MySQL INSERT\',\'2017-07-21\',\'2017-07-22\',\'Start learning..\');\n```\n\n\n\n### 2. INSERT - 插入多行\n\n想要在表中一次插入多行，可以使用具有以下语法的`INSERT`语句：\n\n```sql\nINSERT INTO table(column1,column2...)\nVALUES (value1,value2,...),\n       (value1,value2,...),\n...;\nSQL\n```\n\n在这种形式中，每行的值列表用逗号分隔。例如，要将多行插入到`tasks`表中，请使用以下语句：\n\n```sql\nINSERT INTO tasks(subject,start_date,end_date,description)\nVALUES (\'任务-1\',\'2017-01-01\',\'2017-01-02\',\'Description 1\'),\n       (\'任务-2\',\'2017-01-01\',\'2017-01-02\',\'Description 2\'),\n       (\'任务-3\',\'2017-01-01\',\'2017-01-02\',\'Description 3\');\nSQL\n```\n\n执行上面语句后，返回 - \n\n```shell\nQuery OK, 3 rows affected\nRecords: 3  Duplicates: 0  Warnings: 0\n```\n\n\n\n如果为表中的所有列指定相应列的值，则可以忽略`INSERT`语句中的列列表，如下所示：\n\n```sql\nINSERT INTO table\nVALUES (value1,value2,...);\nSQL\n```\n\n或者-\n\n```sql\nINSERT INTO table\nVALUES (value1,value2,...),\n       (value1,value2,...),\n...;\nSQL\n```\n\n> 请注意，不必为自动递增列(例如`taskid`列)指定值，因为MySQL会自动为[自动递增](http://www.yiibai.com/mysql/sequence.html)列生成值。\n\n\n\n\n\n### 3. 具有SELECT子句的MySQL INSERT\n\n在MySQL中，可以使用[SELECT语句](http://www.yiibai.com/mysql/select-statement-query-data.html)返回的列和值来填充`INSERT`语句的值。此功能非常方便，因为您可以使用`INSERT`和`SELECT`子句完全或部分[复制表](http://www.yiibai.com/mysql/copy-table-data.html)，如下所示：\n\n```sql\nINSERT INTO table_1\nSELECT c1, c2, FROM table_2;\nSQL\n```\n\n假设要将`tasks`表复制到`tasks_bak`表。\n\n**首先**，通过复制`tasks`表的结构，创建一个名为`tasks_bak`的新表，如下所示：\n\n```sql\nCREATE TABLE tasks_bak LIKE tasks;\nSQL\n```\n\n**第二步**，使用以下`INSERT`语句将`tasks`表中的数据插入`tasks_bak`表：\n\n```sql\nINSERT INTO tasks_bak\nSELECT * FROM tasks;\nSQL\n```\n\n**第三步**，检查`tasks_bak`表中的数据，看看是否真正从`tasks`表复制完成了。\n\n```sql\nmysql> select * from tasks;\n+---------+--------------------+------------+------------+------------------+\n| task_id | subject            | start_date | end_date   | description      |\n+---------+--------------------+------------+------------+------------------+\n|       1 | Learn MySQL INSERT | 2017-07-21 | 2017-07-22 | Start learning.. |\n|       2 | 任务-1             | 2017-01-01 | 2017-01-02 | Description 1    |\n|       3 | 任务-2             | 2017-01-01 | 2017-01-02 | Description 2    |\n|       4 | 任务-3             | 2017-01-01 | 2017-01-02 | Description 3    |\n+---------+--------------------+------------+------------+------------------+\n4 rows in set\n```\n\n\n\n### 4. 复制表结构\n\n```mysql\ncreate table test_copy like test;\n```\n\n', 'MySQL', '2022-03-17', 2022, 3);
INSERT INTO `article_tbl` VALUES (1647505912, 'alex', 'Vue通过router-link跳转', '写业务中，从一个页面跳转到另一个页面，经常需要传值和取值，如何实现？\n\n## 1、通过router-link进行跳转\n\n1. 使用`query`传递参数，路由必须使用path引入\n\n   ```html\n   <-- 在a页面进行传值 -->\n       \n   <router-link :to=\"{path: \'/home\', query: {key: \'hello\', value: \'world\'}}\">\n   　　<button>跳转</button>\n   </router-link>       \n   ```\n\n   跳转地址 => /home?key=hello&value=world\n\n   在b页面取值： **this.$route.query.key**\n\n   \n\n2. 使用`params`传递参数，路由必须使用name引入\n\n   ```html\n   <-- 在a页面进行传值 -->\n       \n   <router-link :to=\"{name: \'/home\', params: {key: \'hello\', value: \'world\'}}\">\n   　　<button>跳转</button>\n   </router-link>　　\n   ```\n\n   跳转地址 ==> /home\n\n   在b页面取值：**this.$route.params.key**\n\n\n\n## 2、$router方式跳转\n\n1. 通过query\n\n   ```js\n   this.$router.push({\n   　　path: \'/detail\',\n   　　query: {\n   　　　　name: \'admin\',\n   　　　　code: 10021\n   　　}\n   });\n   ```\n\n   跳转地址 => /detail?name=admin&code=10021\n\n   取值：**this.$route.query.name**\n\n\n\n## 3、vue页面中的内部跳转\n\n如果是vue页面中的内部跳转，可以用this.$router.push()实现，但是如果用这种方法跳到外部链接，就会报错，我们一看链接的路径，原来是我们的外部链接前面加上了http://localhost:8080/#/这一串导致跳转出现问题，那么我们如何跳转到外部链接呢，我们只需用 window.location.href = ‘url’来实现，具体代码如下：\n\n```html\n <span @click=\"See(url)\">点击转跳</span>\n```\n\n\n\n上面是触发一个点击事件，其中item.qj_url是传给see的url链接，下面是事件执行的函数\n\n```js\n See(e) { \n 	window.location.href = e   \n    }\n```\n\nok，到此就结束啦', 'Vue', '2022-03-17', 2022, 3);
INSERT INTO `article_tbl` VALUES (1647505976, 'alice', 'C 程序结构', '## C 程序结构\n\n在我们学习 C 语言的基本构建块之前，让我们先来看看一个最小的 C 程序结构，在接下来的章节中可以以此作为参考。\n\n## C Hello World 实例\n\nC 程序主要包括以下部分：\n\n- 预处理器指令\n- 函数\n- 变量\n- 语句 & 表达式\n- 注释\n\n让我们看一段简单的代码，可以输出单词 \"Hello World\"：\n\n```c\n#include <stdio.h>\n\nint main()\n{\n   /* 我的第一个 C 程序 */\n   printf(\"Hello, World! \\n\");\n\n   return 0;\n}\n```\n\n接下来我们讲解一下上面这段程序：\n\n1. 程序的第一行 #include <stdio.h> 是预处理器指令，告诉 C 编译器在实际编译之前要包含 stdio.h 文件。\n2. 下一行 int main() 是主函数，程序从这里开始执行。\n3. 下一行 /*...*/ 将会被编译器忽略，这里放置程序的注释内容。它们被称为程序的注释。\n4. 下一行 printf(...) 是 C 中另一个可用的函数，会在屏幕上显示消息 \"Hello, World!\"。\n5. 下一行 return 0; 终止 main() 函数，并返回值 0。\n\n## 编译 & 执行 C 程序\n\n接下来让我们看看如何把源代码保存在一个文件中，以及如何编译并运行它。下面是简单的步骤：\n\n1. 打开一个文本编辑器，添加上述代码。\n2. 保存文件为 hello.c。\n3. 打开命令提示符，进入到保存文件所在的目录。\n4. 键入 gcc hello.c，输入回车，编译代码。\n5. 如果代码中没有错误，命令提示符会跳到下一行，并生成 a.out 可执行文件。\n6. 现在，键入 a.out 来执行程序。\n7. 您可以看到屏幕上显示 \"Hello World\"。\n\n```bash\n$ gcc hello.c\n$ ./a.out\nHello, World!\n```\n\n请确保您的路径中已包含 gcc 编译器，并确保在包含源文件 hello.c 的目录中运行它。', 'C', '2022-03-17', 2022, 3);

-- ----------------------------
-- Table structure for tag_tbl
-- ----------------------------
DROP TABLE IF EXISTS `tag_tbl`;
CREATE TABLE `tag_tbl`  (
  `tag` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_tbl
-- ----------------------------
INSERT INTO `tag_tbl` VALUES ('Java');
INSERT INTO `tag_tbl` VALUES ('Python');
INSERT INTO `tag_tbl` VALUES ('Vue');
INSERT INTO `tag_tbl` VALUES ('C');
INSERT INTO `tag_tbl` VALUES ('Other');
INSERT INTO `tag_tbl` VALUES ('MySQL');
INSERT INTO `tag_tbl` VALUES ('Hadoop');

-- ----------------------------
-- Table structure for user_article_tbl
-- ----------------------------
DROP TABLE IF EXISTS `user_article_tbl`;
CREATE TABLE `user_article_tbl`  (
  `uid` int(10) NOT NULL,
  `article_id` int(30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_article_tbl
-- ----------------------------
INSERT INTO `user_article_tbl` VALUES (10001, 770235);
INSERT INTO `user_article_tbl` VALUES (10001, 356922);
INSERT INTO `user_article_tbl` VALUES (10003, 1647505912);
INSERT INTO `user_article_tbl` VALUES (100004, 1647505976);
INSERT INTO `user_article_tbl` VALUES (10002, 1647505781);

-- ----------------------------
-- Table structure for user_collect_tbl
-- ----------------------------
DROP TABLE IF EXISTS `user_collect_tbl`;
CREATE TABLE `user_collect_tbl`  (
  `uid` int(30) NOT NULL,
  `article_id` int(30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_collect_tbl
-- ----------------------------
INSERT INTO `user_collect_tbl` VALUES (10002, 356922);
INSERT INTO `user_collect_tbl` VALUES (10001, 356922);

-- ----------------------------
-- Table structure for user_tbl
-- ----------------------------
DROP TABLE IF EXISTS `user_tbl`;
CREATE TABLE `user_tbl`  (
  `id` int(10) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_tbl
-- ----------------------------
INSERT INTO `user_tbl` VALUES (10001, 'admin', 'admin');
INSERT INTO `user_tbl` VALUES (10002, 'tom', 'tom');
INSERT INTO `user_tbl` VALUES (10003, 'alex', 'alex');
INSERT INTO `user_tbl` VALUES (10004, 'alice', 'alice');

SET FOREIGN_KEY_CHECKS = 1;
