/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.17-log : Database - db_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312*/ IF NOT EXISTS `db_blog` /*!40100*/ DEFAULT CHARACTER SET utf8 ;

USE `db_blog`;



/*Table structure for table `t_blog` */

DROP TABLE IF EXISTS `t_blog`;

CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '文章内容',
  `first_picture` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '首图地址',
  `flag` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '文章类型，原创、转载',
  `views` int(11) NOT NULL COMMENT '浏览次数',
  `appreciation` bit(1) NOT NULL COMMENT '是否开启赞赏',
  `share_statement` bit(1) NOT NULL COMMENT '是否开启分享声明',
  `commentabled` bit(1) NOT NULL COMMENT '是否开启评论',
  `published` bit(1) NOT NULL COMMENT '是否发布',
  `recommend` bit(1) NOT NULL COMMENT '是否推荐',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `description` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `type_id` int(11) NOT NULL COMMENT '分类编号',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `tag_ids` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标签编号1,2,3',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_type` (`type_id`) USING BTREE,
  KEY `fk_user` (`user_id`) USING BTREE,
  CONSTRAINT `fk_type` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `t_sysuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `t_blog` */

insert  into `t_blog`(`id`,`title`,`content`,`first_picture`,`flag`,`views`,`appreciation`,`share_statement`,`commentabled`,`published`,`recommend`,`create_time`,`update_time`,`description`,`type_id`,`user_id`,`tag_ids`) values (5,'学习测试改工作测试','# fafasdfsafasfasfas','https://unsplash.it/800/450?image=1005','转载',128,'','','','','','2020-04-17 10:35:25','2020-08-19 23:26:35','学习测试改工作测试',2,1,'7'),(6,'啦啦啦','胡俊华天下第一','https://unsplash.it/800/450?image=1005','原创',7,'\0','\0','\0','','','2020-08-10 03:01:56','2020-08-10 05:13:11','哈哈哈',4,1,'4,5'),(7,'欢迎','这是我','https://unsplash.it/800/450?image=1005','原创',2,'','\0','','','','2020-08-10 03:02:58','2020-08-10 03:03:08','欢迎',5,1,'5,6'),(8,'我来了','# 我来了','https://unsplash.it/800/450?image=1005','原创',1,'\0','\0','\0','','\0','2020-08-10 03:05:21','2020-08-10 03:05:26','我走了',5,1,'9'),(9,'adad','xX','/images/me.jpg','原创',5,'\0','\0','','','\0','2020-08-18 23:24:04','2020-08-19 08:50:17','dad',3,1,'9,8'),(10,'Java8 Stream','### **Java8Stream**\r\n\r\n					StreamAPI(一)\r\n### 1. 流的基本概念\r\n#### 1.1 什么是流？\r\n流是Java8引入的全新概念，它用来处理集合中的数据，暂且可以把它理解为一种高级集合。\r\n\r\n众所周知，集合操作非常麻烦，若要对集合进行筛选、投影，需要写大量的代码，而流是以声明的形式操作集合，它就像SQL语句，我们只需告诉流需要对集合进行什么操作，它就会自动进行操作，并将执行结果交给你，无需我们自己手写代码。\r\n\r\n因此，流的集合操作对我们来说是透明的，我们只需向流下达命令，它就会自动把我们想要的结果给我们。由于操作过程完全由Java处理，因此它可以根据当前硬件环境选择最优的方法处理，我们也无需编写复杂又容易出错的多线程代码了。\r\n\r\n#### 1.2 流的特点\r\n只能遍历一次 \r\n我们可以把流想象成一条流水线，流水线的源头是我们的数据源(一个集合)，数据源中的元素依次被输送到流水线上，我们可以在流水线上对元素进行各种操作。一旦元素走到了流水线的另一头，那么这些元素就被“消费掉了”，我们无法再对这个流进行操作。当然，我们可以从数据源那里再获得一个新的流重新遍历一遍。\r\n\r\n采用内部迭代方式 \r\n若要对集合进行处理，则需我们手写处理代码，这就叫做外部迭代。而要对流进行处理，我们只需告诉流我们需要什么结果，处理过程由流自行完成，这就称为内部迭代。\r\n\r\n#### 1.3 流的操作种类\r\n流的操作分为两种，分别为中间操作 和 终端操作。\r\n\r\n中间操作 \r\n当数据源中的数据上了流水线后，这个过程对数据进行的所有操作都称为“中间操作”。 \r\n中间操作仍然会返回一个流对象，因此多个中间操作可以串连起来形成一个流水线。\r\n\r\n终端操作 \r\n当所有的中间操作完成后，若要将数据从流水线上拿下来，则需要执行终端操作。 \r\n终端操作将返回一个执行结果，这就是你想要的数据。\r\n\r\n#### 1.4 流的操作过程\r\n使用流一共需要三步：\r\n\r\n准备一个数据源\r\n执行中间操作 \r\n中间操作可以有多个，它们可以串连起来形成流水线。\r\n执行终端操作 \r\n执行终端操作后本次流结束，你将获得一个执行结果。\r\n### 2. 流的使用\r\n#### 2.1 获取流\r\n在使用流之前，首先需要拥有一个数据源，并通过StreamAPI提供的一些方法获取该数据源的流对象。数据源可以有多种形式：\r\n\r\n##### 1.集合\r\n这种数据源较为常用，通过stream()方法即可获取流对象：\r\n\r\n	List<Person> list = new ArrayList<Person>(); \r\n	Stream<Person> stream = list.stream();\r\n\r\n##### 2.数组\r\n通过Arrays类提供的静态函数stream()获取数组的流对象：\r\n\r\n	String[] names = {\"chaimm\",\"peter\",\"john\"};\r\n    Stream<String> stream = Arrays.stream(names);\r\n\r\n##### 3.值\r\n直接将几个值变成流对象：\r\n\r\n	Stream<String> stream =\r\n	Stream.of(\"chaimm\",\"peter\",\"john\");\r\n\r\n\r\n##### 4.文件\r\n	try(Stream lines = Files.lines(Paths.get(“文件路径\r\n	名”),Charset.defaultCharset())){\r\n		//可对lines做一些操作\r\n	}catch(IOException e){\r\n	}\r\nPS：Java7简化了IO操作，把打开IO操作放在try后的括号中即可省略关闭IO的代码。\r\n#### 2.2 筛选filter\r\nfilter函数接收一个Lambda表达式作为参数，该表达式返回boolean，在执行过程中，流将元素逐一输送给filter，并筛选出执行结果为true的元素。 \r\n如，筛选出所有学生：\r\n\r\n    List<Person> result = list.stream()\r\n                    .filter(Person::isStudent)\r\n                    .collect(toList());\r\n\r\n\r\n\r\n#### 2.3 去重distinct\r\n去掉重复的结果：\r\n\r\n    List<Person> result = list.stream()\r\n                    .distinct()\r\n                    .collect(toList());\r\n\r\n\r\n\r\n#### 2.4 截取\r\n截取流的前N个元素：\r\n\r\n    List<Person> result = list.stream()\r\n                    .limit(3)\r\n                    .collect(toList());\r\n\r\n\r\n\r\n#### 2.5 跳过\r\n跳过流的前n个元素：\r\n\r\n    List<Person> result = list.stream()\r\n                    .skip(3)\r\n                    .collect(toList());\r\n\r\n\r\n\r\n#### 2.6 映射\r\n对流中的每个元素执行一个函数，使得元素转换成另一种类型输出。流会将每一个元素输送给map函数，并执行map中的Lambda表达式，最后将执行结果存入一个新的流中。 \r\n如，获取每个人的姓名(实则是将Perosn类型转换成String类型)：\r\n\r\n    List<Person> result = list.stream()\r\n                    .map(Person::getName)\r\n                    .collect(toList());\r\n\r\n\r\n\r\n#### 2.7 合并多个流\r\n例：列出List中各不相同的单词，List集合如下：\r\n\r\n    List<String> list = new ArrayList<String>();\r\n    list.add(\"I am a boy\");\r\n    list.add(\"I love the girl\");\r\n    list.add(\"But the girl loves another girl\");\r\n\r\n\r\n\r\n思路如下：\r\n\r\n- 首先将list变成流：\r\nlist.stream();\r\n\r\n- 按空格分词：\r\n      list.stream()\r\n            .map(line->line.split(\" \"));\r\n\r\n分完词之后，每个元素变成了一个String[]数组。\r\n\r\n- 将每个String[]变成流：\r\n      list.stream()\r\n            .map(line->line.split(\" \"))\r\n            .map(Arrays::stream)\r\n\r\n\r\n此时一个大流里面包含了一个个小流，我们需要将这些小流合并成一个流。\r\n\r\n- 将小流合并成一个大流： \r\n用flagmap替换刚才的map\r\n      list.stream()\r\n            .map(line->line.split(\" \"))\r\n            .flagmap(Arrays::stream)\r\n\r\n\r\n- 去重\r\n      list.stream()\r\n            .map(line->line.split(\" \"))\r\n            .flagmap(Arrays::stream)\r\n            .distinct()\r\n            .collect(toList());\r\n\r\n\r\n\r\n#### 2.8 是否匹配任一元素：anyMatch\r\nanyMatch用于判断流中是否存在至少一个元素满足指定的条件，这个判断条件通过Lambda表达式传递给anyMatch，执行结果为boolean类型。 \r\n如，判断list中是否有学生：\r\n\r\n	boolean result = list.stream()\r\n            .anyMatch(Person::isStudent);\r\n\r\n\r\n#### 2.9 是否匹配所有元素：allMatch\r\nallMatch用于判断流中的所有元素是否都满足指定条件，这个判断条件通过Lambda表达式传递给anyMatch，执行结果为boolean类型。 \r\n如，判断是否所有人都是学生：\r\n\r\n	boolean result = list.stream()\r\n            .allMatch(Person::isStudent);\r\n\r\n\r\n\r\n#### 2.10 是否未匹配所有元素：noneMatch\r\nnoneMatch与allMatch恰恰相反，它用于判断流中的所有元素是否都不满足指定条件：\r\n\r\n	boolean result = list.stream()\r\n            .noneMatch(Person::isStudent);\r\n\r\n\r\n#### 2.11 获取任一元素findAny\r\nfindAny能够从流中随便选一个元素出来，它返回一个Optional类型的元素。\r\n\r\n	Optional<Person> person = list.stream()\r\n                                    .findAny();\r\n\r\n#### Optional介绍\r\nOptional是Java8新加入的一个容器，这个容器只存1个或0个元素，它用于防止出现NullpointException，它提供如下方法：\r\n\r\n- isPresent() \r\n判断容器中是否有值。\r\n- ifPresent(Consume lambda) \r\n容器若不为空则执行括号中的Lambda表达式。\r\n- T get() \r\n获取容器中的元素，若容器为空则抛出NoSuchElement异常。\r\n- T orElse(T other) \r\n获取容器中的元素，若容器为空则返回括号中的默认值。\r\n\r\n#### 2.12 获取第一个元素findFirst\r\n       Optional<Person> person = list.stream()\r\n                   .findFirst();\r\n\r\n#### 2.13 归约\r\n归约是将集合中的所有元素经过指定运算，折叠成一个元素输出，如：求最值、平均数等，这些操作都是将一个集合的元素折叠成一个元素输出。\r\n\r\n在流中，reduce函数能实现归约。 \r\nreduce函数接收两个参数：\r\n\r\n- 初始值\r\n- 进行归约操作的Lambda表达式\r\n##### 2.13.1 元素求和：自定义Lambda表达式实现求和\r\n例：计算所有人的年龄总和\r\n	  int age = list.stream().reduce(0,(person1,person2)->person1.getAge()+person2.getAge());\r\n\r\nreduce的第一个参数表示初试值为0\r\nreduce的第二个参数为需要进行的归约操作，它接收一个拥有两个参数的Lambda表达式，reduce会把流中的元素两两输给Lambda表达式，最后将计算出累加之和。\r\n\r\n##### 2.13.2 元素求和：使用Integer.sum函数求和\r\n上面的方法中我们自己定义了Lambda表达式实现求和运算，如果当前流的元素为数值类型，那么可以使用Integer提供了sum函数代替自定义的Lambda表达式，如：\r\n\r\n	int age = list.stream().reduce(0, Integer::sum);\r\n\r\nInteger类还提供了min、max等一系列数值操作，当流中元素为数值类型时可以直接使用。\r\n\r\n#### 2.14 数值流的使用\r\n采用reduce进行数值操作会涉及到基本数值类型和引用数值类型之间的装箱、拆箱操作，因此效率较低。 \r\n当流操作为纯数值操作时，使用数值流能获得较高的效率。\r\n\r\n##### 2.14.1 将普通流转换成数值流\r\nStreamAPI提供了三种数值流：IntStream、DoubleStream、LongStream，也提供了将普通流转换成数值流的三种方法：mapToInt、mapToDouble、mapToLong。 \r\n如，将Person中的age转换成数值流：\r\n\r\n	IntStream stream = list.stream()\r\n                            .mapToInt(Person::getAge);\r\n\r\n##### 2.14.2 数值计算\r\n每种数值流都提供了数值计算函数，如max、min、sum等。 \r\n如，找出最大的年龄：\r\n\r\n	OptionalInt maxAge = list.stream()\r\n                                .mapToInt(Person::getAge)\r\n                                .max();\r\n\r\n由于数值流可能为空，并且给空的数值流计算最大值是没有意义的，因此max函数返回OptionalInt，它是Optional的一个子类，能够判断流是否为空，并对流为空的情况作相应的处理。 \r\n\r\n此外，mapToInt、mapToDouble、mapToLong进行数值操作后的返回结果分别为：OptionalInt、OptionalDouble、OptionalLong\r\n\r\n					StreamAPI(二）\r\n### 1. 收集器简介\r\n收集器用来将经过筛选、映射的流进行最后的整理，可以使得最后的结果以不同的形式展现。\r\n\r\ncollect方法即为收集器，它接收Collector接口的实现作为具体收集器的收集方法。\r\n\r\nCollector接口提供了很多默认实现的方法，我们可以直接使用它们格式化流的结果；也可以自定义Collector接口的实现，从而定制自己的收集器。\r\n\r\n这里先介绍Collector常用默认静态方法的使用，自定义收集器会在下一篇博文中介绍。\r\n\r\n### 2. 收集器的使用\r\n#### 2.1 归约\r\n流由一个个元素组成，归约就是将一个个元素“折叠”成一个值，如求和、求最值、求平均值都是归约操作。\r\n\r\n##### 2.1.1 计数\r\n	long count = list.stream()\r\n                    .collect(Collectors.counting());\r\n\r\n也可以不使用收集器的计数函数：\r\n\r\n	long count = list.stream().count();\r\n\r\n注意：计数的结果一定是long类型。\r\n\r\n##### 2.1.2 最值\r\n例：找出所有人中年龄最大的人\r\n\r\n	Optional<Person> oldPerson = list.stream()                 .collect(Collectors.maxBy(Comparator.comparingInt(Person::getAge)));\r\n\r\n计算最值需要使用Collector.maxBy和Collector.minBy，这两个函数需要传入一个比较器Comparator.comparingInt，这个比较器又要接收需要比较的字段。\r\n这个收集器将会返回一个Optional类型的值。 \r\nOptional类简介请移步至：Java8新特性——StreamAPI(一)\r\n\r\n##### 2.1.3 求和\r\n例：计算所有人的年龄总和\r\n\r\n	int summing = list.stream()                   .collect(Collectors.summingInt(Person::getAge));\r\n\r\n当然，既然Java8提供了summingInt，那么还提供了summingLong、summingDouble。\r\n\r\n##### 2.1.4 求平均值\r\n例：计算所有人的年龄平均值\r\n\r\n	double avg = list.stream()                 .collect(Collectors.averagingInt(Person::getAge));\r\n\r\n注意：计算平均值时，不论计算对象是int、long、double，计算结果一定都是double。\r\n\r\n##### 2.1.5 一次性计算所有归约操作\r\nCollectors.summarizingInt函数能一次性将最值、均值、总和、元素个数全部计算出来，并存储在对象IntSummaryStatisics中。 \r\n可以通过该对象的getXXX()函数获取这些值。\r\n\r\n##### 2.1.6 连接字符串\r\n例：将所有人的名字连接成一个字符串\r\n\r\n	String names = list.stream()\r\n                        .collect(Collectors.joining());\r\n\r\n每个字符串默认分隔符为空格，若需要指定分隔符，则在joining中加入参数即可：\r\n\r\n	String names = list.stream()\r\n                        .collect(Collectors.joining(\", \"));\r\n\r\n此时字符串之间的分隔符为逗号。\r\n\r\n##### 2.1.7 一般性的归约操作\r\n若你需要自定义一个归约操作，那么需要使用Collectors.reducing函数，该函数接收三个参数：\r\n\r\n第一个参数为归约的初始值\r\n第二个参数为归约操作进行的字段\r\n第三个参数为归约操作的过程\r\n例：计算所有人的年龄总和\r\n\r\n	Optional<Integer> sumAge = list.stream()           .collect(Collectors.reducing(0,Person::getAge,(i,j)->i+j));\r\n\r\n上面例子中，reducing函数一共接收了三个参数：\r\n\r\n第一个参数表示归约的初始值。我们需要累加，因此初始值为0\r\n第二个参数表示需要进行归约操作的字段。这里我们对Person对象的age字段进行累加。\r\n第三个参数表示归约的过程。这个参数接收一个Lambda表达式，而且这个Lambda表达式一定拥有两个参数，分别表示当前相邻的两个元素。由于我们需要累加，因此我们只需将相邻的两个元素加起来即可。\r\nCollectors.reducing方法还提供了一个单参数的重载形式。 \r\n你只需传一个归约的操作过程给该方法即可(即第三个参数)，其他两个参数均使用默认值。\r\n\r\n- 第一个参数默认为流的第一个元素\r\n- 第二个参数默认为流的元素 \r\n这就意味着，当前流的元素类型为数值类型，并且是你要进行归约的对象。\r\n例：采用单参数的reducing计算所有人的年龄总和\r\n\r\n	Optional<Integer> sumAge = list.stream()\r\n            .filter(Person::getAge)\r\n            .collect(Collectors.reducing((i,j)->i+j));\r\n\r\n#### 2.2 分组\r\n分组就是将流中的元素按照指定类别进行划分，类似于SQL语句中的GROUPBY。\r\n\r\n##### 2.2.1 一级分组\r\n例：将所有人分为老年人、中年人、青年人\r\n\r\n	Map<String,List<Person>> result = list.stream()\r\n	.collect(Collectors.groupingby((person)->{\r\n        if(person.getAge()>60)\r\n            return \"老年人\";\r\n        else if(person.getAge()>40)\r\n            return \"中年人\";\r\n        else\r\n            return \"青年人\";\r\n                                    }));\r\n\r\ngroupingby函数接收一个Lambda表达式，该表达式返回String类型的字符串，groupingby会将当前流中的元素按照Lambda返回的字符串进行分组。 \r\n分组结果是一个Map< String,List< Person>>，Map的键就是组名，Map的值就是该组的Perosn集合。\r\n\r\n##### 2.2.2 多级分组2.2.2 多级分组\r\n多级分组可以支持在完成一次分组后，分别对每个小组再进行分组。 \r\n使用具有两个参数的groupingby重载方法即可实现多级分组。\r\n\r\n- 第一个参数：一级分组的条件\r\n- 第二个参数：一个新的groupingby函数，该函数包含二级分组的条件\r\n例：将所有人分为老年人、中年人、青年人，并且将每个小组再分成：男女两组。\r\n\r\n	  Map<String,Map<String,List<Person>>> result = list.stream()                                    .collect(Collectors.groupingby((person)->{\r\n        if(person.getAge()>60)\r\n            return \"老年人\";\r\n        else if(person.getAge()>40)\r\n            return \"中年人\";\r\n        else\r\n            return \"青年人\";\r\n                                    },\r\n                                    groupingby(Person::getSex)));\r\n\r\n此时会返回一个非常复杂的结果：Map< String,Map< String,List< Person>>>。\r\n\r\n##### 2.2.3 对分组进行统计2.2.3 对分组进行统计\r\n拥有两个参数的groupingby函数不仅仅能够实现多几分组，还能对分组的结果进行统计。\r\n\r\n例：统计每一组的人数\r\n\r\n	Map<String,Long> result = list.stream()                                 .collect(Collectors.groupingby((person)->{\r\n        if(person.getAge()>60)\r\n            return \"老年人\";\r\n        else if(person.getAge()>40)\r\n            return \"中年人\";\r\n        else\r\n            return \"青年人\";\r\n                                    },\r\n                                    counting()));\r\n\r\n此时会返回一个Map< String,Long>类型的map，该map的键为组名，map的值为该组的元素个数。\r\n\r\n将收集器的结果转换成另一种类型\r\n当使用maxBy、minBy统计最值时，结果会封装在Optional中，该类型是为了避免流为空时计算的结果也为空的情况。在单独使用maxBy、minBy函数时确实需要返回Optional类型，这样能确保没有空指针异常。然而当我们使用groupingBy进行分组时，若一个组为空，则该组将不会被添加到Map中，从而Map中的所有值都不会是一个空集合。既然这样，使用maxBy、minBy方法计算每一组的最值时，将结果封装在optional对象中就显得有些多余。 \r\n我们可以使用collectingAndThen函数包裹maxBy、minBy，从而将maxBy、minBy返回的Optional对象进行转换。\r\n\r\n例：将所有人按性别划分，并计算每组最大的年龄。\r\n\r\n	Map<String,Integer> map = list.stream()                            .collect(groupingBy(Person::getSex,\r\n                            collectingAndThen(                          maxBy(comparingInt(Person::getAge)),\r\n                            Optional::get\r\n		)));\r\n\r\n\r\n此时返回的是一个Map< String,Integer>，String表示每组的组名(男、女)，Integer为每组最大的年龄。 \r\n如果不用collectingAndThen包裹maxBy，那么最后返回的结果为Map< String,Optional< Person>>。 \r\n使用collectingAndThen包裹maxBy后，首先会执行maxBy函数，该函数执行完后便会执行Optional::get，从而将Optional中的元素取出来。\r\n\r\n#### 2.3 分区\r\n分区是分组的一种特殊情况，它只能分成true、false两组。 \r\n分组使用partitioningBy方法，该方法接收一个Lambda表达式，该表达是必须返回boolean类型，partitioningBy方法会将Lambda返回结果为true和false的元素各分成一组。 \r\npartitioningBy方法返回的结果为Map< Boolean,List< T>>。 \r\n此外，partitioningBy方法和groupingBy方法一样，也可以接收第二个参数，实现二级分区或对分区结果进行统计。','/images/java.jpg','原创',11,'\0','','','','','2020-08-19 02:48:23','2020-08-19 23:21:48','Java8 Stream的学习与使用',1,1,'4');

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nickname` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `email` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '邮箱',
  `content` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '头像地址',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `admin_comment` bit(1) NOT NULL COMMENT '管理员评论',
  `blog_id` int(11) NOT NULL COMMENT '博客编号',
  `reply_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '被回复人昵称',
  `parent_comment_id` int(11) NOT NULL COMMENT '父评论编号',
  `top_comment_id` int(11) NOT NULL COMMENT '记录回复的编号，例如5回复的1，记录的是1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_blog` (`blog_id`) USING BTREE,
  CONSTRAINT `fk_blog` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `t_comment` */

insert  into `t_comment`(`id`,`nickname`,`email`,`content`,`avatar`,`create_time`,`admin_comment`,`blog_id`,`reply_name`,`parent_comment_id`,`top_comment_id`) values (1,'用户1','670551262@qq.com','1测试','/images/avatar.png','2020-04-19 06:50:10','\0',5,NULL,-1,-1),(3,'用户2','670551262@qq.com','测试2','/images/avatar.png','2020-04-19 06:55:09','\0',5,NULL,-1,-1),(4,'李泽','ee@163.comaa','你好，测试','/images/avatar.png','2020-04-19 07:20:50','\0',5,'用户1',1,1),(5,'管理员','ee@163.comaa','你好，测试成功了吗','/images/avatar.png','2020-04-19 07:22:30','\0',5,'李泽',4,1),(6,'管理员','670551262@qq.com','测试成功 了','/images/me.jpg','2020-04-19 07:24:00','',5,'管理员',5,1),(7,'管理员','670551262@qq.com','测试成功了','/images/me.jpg','2020-04-19 07:24:44','',5,'管理员',5,1),(8,'管理员','670551262@qq.com','正在测试中','/images/me.jpg','2020-04-19 07:30:28','',5,'管理员',5,1),(9,'沐安','ee@163.comaa','再次测试','/images/avatar.png','2020-04-19 07:47:04','\0',5,'用户2',3,3),(10,'沐安','ee@163.comaa','发发发','/images/avatar.png','2020-04-19 07:47:18','\0',5,'沐安',9,3),(11,'用户1','670551262@qq.com','你好','/images/avatar.png','2020-04-19 08:10:43','\0',5,'李泽',4,1),(12,'管理员','670551262@qq.com','1','/images/me.jpg','2020-08-10 03:05:56','',7,NULL,-1,-1),(13,'12','2283644684@qq.com','123','/images/avatar.png','2020-08-18 23:58:14','\0',9,NULL,-1,-1),(14,'1','1966189192@qq.com','1','/images/avatar.png','2020-08-19 00:00:17','\0',9,NULL,-1,-1),(15,'12','2283644684@qq.com','12','/images/avatar.png','2020-08-19 00:00:32','\0',9,'12',13,13),(16,'admin','2283644684@qq.com','123','/images/avatar.png','2020-08-19 00:02:02','\0',9,NULL,-1,-1),(17,'胡俊华','2283644684@qq.com','不错','/images/avatar.png','2020-08-19 03:11:48','\0',10,NULL,-1,-1),(18,'管理员','2283644684@qq.com','谢谢','/images/avatar.png','2020-08-19 09:09:00','\0',10,NULL,-1,-1),(19,' 胡俊华','2283644684@qq.com','嗯嗯','/images/avatar.png','2020-08-19 09:09:21','\0',10,'管理员',18,18),(20,'啊','2283644684@qq.com','11','/images/avatar.png','2020-08-19 23:24:18','\0',10,' 胡俊华',19,18),(21,'管理员','2283644684@qq.com','哈哈','/images/avatar.png','2020-08-19 23:27:26','\0',5,'李泽',4,1),(22,'admin','2283644684@qq.com','略略略','/images/avatar.png','2020-08-19 23:32:09','\0',5,NULL,-1,-1),(23,'admin','2283644684@qq.com','略略略','/images/me.jpg','2020-08-19 23:36:15','',5,'admin',22,22);

/*Table structure for table `t_sysuser` */

DROP TABLE IF EXISTS `t_sysuser`;

CREATE TABLE `t_sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，编号',
  `nickname` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `username` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `email` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '邮箱地址',
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '头像地址',
  `type` int(1) NOT NULL COMMENT '用户类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `t_sysuser` */

insert  into `t_sysuser`(`id`,`nickname`,`username`,`password`,`email`,`avatar`,`type`,`create_time`,`update_time`) values (1,'管理员','admin','202CB962AC59075B964B07152D234B70','670551262@qq.com','/images/me.jpg',1,'2020-04-17 09:19:57','2020-04-17 09:20:00'),(2,'胡俊华','hjh','ACC4E429C8421280FFF6265287D6FDD9','2283644684@qq.com','/images/me.jpg',1,'2020-08-12 18:00:54','2020-08-12 18:00:57');

/*Table structure for table `t_tag` */

DROP TABLE IF EXISTS `t_tag`;

CREATE TABLE `t_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `t_tag` */

insert  into `t_tag`(`id`,`name`) values (4,'Java'),(5,'前端基础'),(6,'动漫'),(7,'面试'),(8,'数据库'),(9,'其他');

/*Table structure for table `t_type` */

DROP TABLE IF EXISTS `t_type`;

CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，编号',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `t_type` */

insert  into `t_type`(`id`,`name`) values (1,'学习'),(2,'工作'),(3,'影视'),(4,'总结'),(5,'生活');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
