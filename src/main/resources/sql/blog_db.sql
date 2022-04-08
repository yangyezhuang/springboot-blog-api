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

 Date: 17/03/2022 15:29:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article_tbl
-- ----------------------------
DROP TABLE IF EXISTS `article_tbl`;
CREATE TABLE `article_tbl`  (
  `id` int(30) NULL DEFAULT NULL,
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
INSERT INTO `article_tbl` VALUES (442099, 'C语言', '## C语言介绍 \nC 语言是一种通用的、面向过程式的计算机程序设计语言。1972 年，为了移植与开发 UNIX 操作系统，丹尼斯·里奇在贝尔电话实验室设计开发了 C 语言。 \n\n```\n#include <stdio.h>\n \nint main()\n{\n    /* 我的第一个 C 程序 */\n    printf(\"Hello, World! \\n\");\n \n    return 0;\n}\n```\n', 'C', '2022-03-16', 2022, 3);
INSERT INTO `article_tbl` VALUES (271822, 'linux', 'Ubuntu是一个以桌面应用为主的 Linux 操作系统，其名称来自非洲南部祖鲁语或豪萨语的“ubuntu\"一词，意思是“人性”“我的存在是因为大家的存在\"，是非洲传统的一种价值观。. Ubuntu基于 Debian 发行版和Gnome桌面环境，而从11.04版起，Ubuntu发行版放弃了 Gnome 桌面环境，改为Unity。. 从前人们认为Linux难以安装、难以使用，在Ubuntu出现后这些都成为了历史。. Ubuntu也拥有庞大的社区力量，用户可以方便地从社区获得帮助。. [1] 自Ubuntu 18.04 LTS起，Ubuntu发行版又重新开始使用 GNOME3 桌面环境', 'Linux', '2019-03-29', 2019, 3);
INSERT INTO `article_tbl` VALUES (754603, 'hadoop', 'Hadoop起源于Apache Nutch项目，始于2002年，是Apache Lucene的子项目之一。2004年，Google在“操作系统设计与实现”（Operating Sy…', 'Hadoop', '2022-02-28', 2022, 1);
INSERT INTO `article_tbl` VALUES (441061, 'Vue-roter', 'Vue.js 教程 Vue.js（读音 /vjuː/, 类似于 view） 是一套构建用户界面的渐进式框架。 Vue 只关注视图层， 采用自底向上增量开发的设计。 Vue 的目标是通过尽可能简单的 API 实现响应的数据绑定', 'Vue', '2022-02-28', 2022, 1);
INSERT INTO `article_tbl` VALUES (770235, 'python爬虫', 'Python 爬虫指的是用 Python 语言来编写爬虫程序。 除了 Python 外，其他语言也可以编写，比如 Java、PHP 等，不过相比较而言，Python 更为简单和实用。', 'Python', '2022-02-28', 2022, 2);
INSERT INTO `article_tbl` VALUES (356922, 'Java排序方法', '## Java排序方法\n\n#### 冒泡排序\n\n1. 相邻记录，反序则交换，if(a[j]>a[j+1])\n2. 冒泡排序每一趟都能把一个数送到最终位置【最大(向前向后），最小(从后向前)】\n3. 时间复杂度：平均o(n*n),最坏的情况：n-1+n-2+n-3....+1=n(n-1)/2，最好的情况：比较n-1次，交换0次o(n)\n4. 冒泡排序法受初始序列的影响\n5. 空间复杂度：o(1)\n6. 冒泡排序是稳定的【相同关键字在比较过程中不会发生前后位置交换】\n\n```java\nfor(i=1;i<n;i++){\n    for(j=0;j<n-i;j++)\n        if(a[j]>a[i]){\n            t=a[j];\n            a[j]=a[j+1];\n            a[j+1]=t;\n        }  \n}\n```\n\n\n\n#### 快速排序\n\n1. 枢轴：序列的第一个数当作枢轴先提出，i从前向后，j从后向前，都与枢轴比，j对应的数小于枢轴则提到i处，i对应的数大于枢轴则提到j处，i，j相遇则将枢轴值填入\n2. 每一次会把当前序列中的一个数送到最终位置【枢轴】\n3. 时间复杂度：o(log₂n)，原始有序时间复杂度最差：o(n² )\n4. 快速排序时间受初始序列影响（初始有序，反倒最差）\n5. 空间复杂度：o(log₂n)\n6. 稳定性：不稳定\n\n\n\n#### 选择排序\n\n1. 第i躺选当第i小的值，放到第i个位置【求最小值】\n\n2. 时间复杂度o(n²)\n\n3. 选择排序每一趟都能把一个值送到最终位置，从待排序序列中选择一个最小值放到已排序序列的末尾\n\n4. 选择排序时间不受初始序列影响，恒为o(n²)\n\n5. 空间复杂度：交换时用一个空间o(1)\n\n6. 选择排序不稳定\n\n   ```java\n   for(i=0;i<n-1;i++){\n       k=i;\n       for(j=i+1;j<n;j++){\n           if(a[j]<a[k])\n               k=j;\n           if(k!=i){\n               t=a[i];\n               a[i]=a[k];\n               a[k]=t;\n           }\n       }\n   }\n   ```\n\n   \n\n#### 插入排序\n\n   1. 直接插入排序\n\n      （1）基本思想：将一个待排序记录插入到一个有序子序列中依然保持有序。\n\n      （2）最后一次排序开始之前有可能所有的元素都不在最终位置上，也就是说插入排序并不保证每一趟都		  把一个元素送到最终位置上\n      （3）插入排序最好的情况下：数据已经按要求有序，比较n-1次，不发生移动o(n)\n      		  最坏的情况下：数据全部反序，需要比较n(n-1)/2，移动n(n-1)/2，o(n²)\n\n      （4）插入排序受数据初始序列的影响，数据基本有序的时候用插入排序最好。\n      （5）空间复杂度：o(1)\n      （6）稳定性：稳定\n\n      \n\n#### 希尔排序\n\n1. 分组插入排序，逐渐合并分组后再插入排序\n2. 稳定性：不稳定\n\n\n\n#### 归并排序\n\n1. 两个有序子序列合并成一个有序子序列\n2. 归并排序每一趟都要进行n次赋值，进行log₂n躺，所以时间复杂度恒o(log₂n)\n3. 最后一次排序开始之前有可能所有的元素都不在最终位置上，也就是说归并排序并不保证每一趟都把一个元素送到最终位置\n4. 空间复杂度：o(n)\n5. 稳定性：稳定\n\n\n\n#### 堆排序【选择类排序】\n\n1. 基本思想：树形选择排序的一个变形，使用一种堆的概念\n\n2. 大根堆【从小到大排序】任意一个非叶子结点的值都大于其左右孩子的值，\n\n   小根堆【从大到小排序】任意一个非叶子结点的值都小于其左右孩子的值，\n\n3. 时间复杂度：初始建堆+n-2次调整堆时间，恒为o(log₂n)\n\n4. 空间复杂度：o(1)交换用的一个空间\n\n5. 每趟都会把一个元素送到最终位置\n\n6. 不受初始序列的影响\n\n7. 不稳定\n\n\n\n#### 基数排序【桶】\n\n1. 基本思想：按数值的各位进行桶的分配，之后收集成一组，再按十位分配桶，再收集，再按百位分配收集，依次进行\n2. 位数为d，基数(桶数)\n\n\n\n#### 总结：\n\n不稳定排序：快速排序，选择排序，堆排序，希尔排序\n\n稳定排序：冒泡排序，直接插入排序，归并排序，基数排序\n\n时间复杂度受初始序列影响：快速排序，希尔排序，直接插入排序，冒泡排序\n\n每次排序都能使一个元素到达最终位置：快速排序，选择排序(最小)，堆排序(最大)，冒泡排序(大泡沉底)\n\n平均性能最好的是：快速排序\n\n空间复杂度最大的是：归并排序\n\n基本有序时选：插入排序\n\n数据有序反而更差的是：快速排序\n\n \n\n\n\n\n\n', 'Java', '2022-03-16', 2022, 3);

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
INSERT INTO `tag_tbl` VALUES ('Hadoop');
INSERT INTO `tag_tbl` VALUES ('Linux');
INSERT INTO `tag_tbl` VALUES ('Vue');
INSERT INTO `tag_tbl` VALUES ('C');
INSERT INTO `tag_tbl` VALUES ('Other');

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

SET FOREIGN_KEY_CHECKS = 1;
