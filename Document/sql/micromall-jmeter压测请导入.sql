/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.232.198
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 192.168.232.198:3306
 Source Schema         : micromall

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 23/04/2020 13:36:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `read_count` int(1) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `help_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `report_type` int(1) NULL DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `report_object` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_status` int(1) NULL DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int(1) NULL DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户举报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varbinary(500) NULL DEFAULT NULL COMMENT '展示图片',
  `sort` int(11) NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
INSERT INTO `cms_prefrence_area` VALUES (1, '让音质更出众', '音质不打折 完美现场感', NULL, NULL, 1);
INSERT INTO `cms_prefrence_area` VALUES (2, '让音质更出众22', '让音质更出众22', NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (3, '让音质更出众33', NULL, NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (4, '让音质更出众44', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区和产品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
INSERT INTO `cms_prefrence_area_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (24, 1, 23);

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题主图',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(1) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `collect_count` int(11) NULL DEFAULT NULL,
  `read_count` int(11) NULL DEFAULT NULL,
  `comment_count` int(11) NULL DEFAULT NULL,
  `album_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `forward_count` int(11) NULL DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
INSERT INTO `cms_subject` VALUES (1, 1, '轮廓分明，双摄手机映现细腻美照', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t26434/217/1381240043/254214/290f9d5b/5bc6c11cN54567a27.jpg!q70.jpg', NULL, 1, '2018-11-11 13:26:55', 100, 1000, 100, NULL, '手机对于拍照党来说，已经不仅仅是通讯工具那么简单了。因为有时TA还充当着“单反”的角色，来不断地带给那些喜欢拍照的人惊喜。所以，在这里准备一波高颜值的双摄手机来给大家。让TA们灵敏捕捉影像的能力，为你展现出轮廓更加分明、且画质更加细腻的美照。', 1, NULL, NULL, '精选专题');
INSERT INTO `cms_subject` VALUES (2, 1, '交通拥挤有妙招，电动车小巧穿行无障碍', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t14224/229/529700229/74868/a1cc7364/5a314f85N5bfd22c7.jpg!q70.jpg', NULL, 1, '2018-11-12 13:27:00', 100, 1000, 100, NULL, '随着人们消费水平的提高，公路上的小车是越来越多了，导致每到上下班高峰期的时候，大路的车辆堵了一环又一环，而且你根本不知道它到底会塞多久，所以我们需要变通一下，不妨骑上电动车来个绿色出行，它够小巧玲珑，即使交通再怎么拥挤，也总有它可以通过的地方。', 1, NULL, NULL, '精选专题');
INSERT INTO `cms_subject` VALUES (3, 1, '无酒不成席，甘香白酒开怀助兴', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t1/881/4/12265/114011/5bd1446fEc71114bf/68925bfb4a2adc44.jpg!q70.jpg', NULL, 1, '2018-11-13 13:27:05', 100, 1000, 100, NULL, '白酒是由各种优质的高粱，小麦，大米等谷物为原料，经过传统工艺的长时间酿造，酒液在这样的环境中慢慢发酵，最终变成清香浓郁的白酒，被摆上人们的餐桌，供人畅饮，是一种受到大众喜爱的绝佳饮品。', 1, NULL, NULL, '精选专题');
INSERT INTO `cms_subject` VALUES (4, 2, '真规划不盲扫，全域清洁净无尘', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t15205/35/2539924281/429185/72fa7857/5aab2c4bN6a32a6c5.png', NULL, 1, '2018-11-01 13:27:09', 100, 1000, 100, NULL, '科技时代，聪明女人会选择用智慧来减负，和繁琐的家务挥手再见，才能腾出更多休闲时间。规划式扫地机器人设计个性化，它能够跟据房间布置呈现清扫路线，实现规划式覆盖性清洁，少遗漏不盲扫，从而大幅度降低损耗，侦测技术遇到家具及时避让，杜绝猛烈撞击，任它灵巧穿梭于低矮空间，坐享居家净无尘。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (5, 2, '抑菌更纯净，直饮净水保家人健康', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t11428/340/1504074828/20474/1e8cab1e/5a0305d3Nb1e7a762.jpg!q70.jpg', NULL, 1, '2018-11-06 13:27:18', 100, 1000, 100, NULL, '在城里居住，首先要担心的是饮水问题。桶装水太贵不够经济，还不一定是干净的。自己去干净的水源地取水也不切实际。此时只有选择在家里安装一台净水器才实在。装上一台直饮式的净水器，方便安全，关键是水质过滤得比较纯净，很大限度地处理了大部分的废弃物，留下健康的矿物质水。好生活，从一口干净的纯净水开始。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (6, 2, '储鲜冷冻灵活变，多门无霜更贴心', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t13015/356/2397552584/605232/46c88e6e/5a5321bcN6a8866f0.png', NULL, 1, '2018-11-07 13:27:21', 100, 1000, 100, NULL, '春节临近，每个家庭都要储备不少食材，但各种食材的保鲜方式与温度不尽相同，而多门风冷冰箱能轻松满足您。它们容积大占地小，拥有多个可以独立调节温度的温区，满足对不同类食材的存放需求，同时省去除霜烦恼，还可以通过温度调节满足您对大冷藏及大冷冻的需求变化，从而带来更好的保鲜冷冻体验，为新年宴请保驾护航。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (7, 2, '想喝健康水，就用304不锈钢热水壶', 'https://img13.360buyimg.com/mobilecms/s1500x600_jfs/t12541/90/443985343/33603/65d6e884/5a0bb77aNff08550a.jpg!q70.jpg', NULL, 1, '2019-01-29 11:21:55', 100, 1000, 100, NULL, '大冬天的喝一口热水，不仅能够暧身还可以给身体补充足够的水份，但是对于热水壶的购买却是需要慎之又慎，材质不好的热水壶在烧水的过程当中极容易产生对身体不利的有害物，极大影响人们的身体健康。304不锈钢热水壶选用食品级不不锈钢，确保水质安全，烧水健康好水，为您的饮水健康保驾护航。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (8, 2, '你尽情赖床！早餐“煲”在它身上', 'https://img14.360buyimg.com/mobilecms/s1500x600_jfs/t15949/363/1450937723/89513/7d8c1219/5a531d28N2aaec2a6.jpg!q70.jpg', NULL, 1, '2019-01-29 13:07:13', 100, 1000, 100, NULL, '赖床不想起，饿了的时候想吃饭又要现做等待简直饥肠辘辘让人心烦，所以一款带有预约功能的电饭煲简直不要太贴心，你睡懒觉的时候它已经给你做好了香滑软糯的粥，起床就能享美味是不是很贴心呐。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (9, 2, '小白变大厨，微波炉为实力加持', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t1/8774/21/11460/38908/5c2cbfcfEdab1ef03/d5800f0f7cf05b38.jpg!q70.jpg', NULL, 1, '2019-01-29 13:08:18', 100, 1000, 100, NULL, '对于厨艺小白而言，没有什么能比掌握好火候更来得困难的了！毕竟烹饪出食物的味道好坏，很大程度上还是对火候的掌控，想要轻松掌握火候，当然少不了一款微波炉的撑场，内设多功能，满足不同的烹饪需求，简单方便易操作，让厨艺小白秒变大师！', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (10, 2, '十秒鲜榨，冬日把爱浓缩成杯果汁', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t13708/126/308291722/542847/26ee6edd/5a07dc72N3252a9e0.png', NULL, 1, '2019-01-29 13:10:02', 100, 1000, 100, NULL, '寒瑟冬日女友不喜欢吃水果，用便携迷你果汁机，撩妹又养胃。一按一转，碾压切割，简单快速制作，压榨出纯原味果汁。一键启动，十秒出汁，保留食物营养，轻轻松松粉碎食物，营养在手，说走就走。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (11, 3, '饭点未到肚已空？美味饼干先充饥', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t13240/79/443357432/38567/94792c4c/5a0ba054N89388654.jpg!q70.jpg', NULL, 1, '2019-01-29 13:10:45', 100, 1000, 100, NULL, '一上午都把精力集中在工作中，刚闲下来就发现自己已是饥肠辘辘了，可饭点却还没到，怎么办呢？不妨让这些美味饼干先帮你充充饥吧！酥香松脆有营养，每一口都让人回味无穷，既能满足你挑剔的味蕾又能起到果腹效果，快快为自己备上吧！', 1, NULL, NULL, '美食专题');
INSERT INTO `cms_subject` VALUES (12, 3, '赖床无罪，香酥面包营养又便捷', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t9775/33/1197239610/38547/34899011/59ddbd01N0bd693bb.jpg!q70.jpg', NULL, 1, '2019-01-29 13:11:41', 100, 1000, 100, NULL, '赖床是很多年轻人的通病，特别是秋冬季节，都会恋恋不舍温暖的被窝。对于苦逼的上班族来说，就算再多睡几分钟，还是要起床的，甚至来不及吃早餐。面包营养丰富，能快速饱腹，且携带方便，再搭配一盒牛奶，一顿简单而不失营养的早餐能提供一天的能量，让赖床族多睡几分钟也无妨。', 1, NULL, NULL, '美食专题');
INSERT INTO `cms_subject` VALUES (13, 3, '夹心饼干，予多重滋味交织舌尖', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t18877/139/652452758/27262/36e6ed6e/5a9d5b6dN327150e8.jpg!q70.jpg', NULL, 1, '2019-01-29 13:12:38', 100, 1000, 100, NULL, '饼干味道香脆可口，深受不少人的青睐。饼干的种类多样，而夹心饼干就是其中一种，相比普通饼干而言，夹心饼干有着更丰富的口感，当肚子空空如也的时候，来一些美味的夹心饼干，既能解馋，又能扛饿。下面就为大家推荐一组好吃的夹心饼干，作为办公室小零食非常不错。', 1, NULL, NULL, '美食专题');
INSERT INTO `cms_subject` VALUES (14, 4, '户外Party，便携音箱烘气氛', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t17125/265/644948348/42066/6f2dc610/5a9c9da1N9a95ee2c.jpg!q70.jpg', NULL, 1, '2019-01-29 13:13:53', 100, 1000, 100, NULL, '初春的季节，除了户外的各种踏青旅行，在户外开异常Party也是很惬意。户外派对，气氛的烘托肯定不能离开音箱的衬托，选择一款户外的便携音箱，无线蓝牙连接，免去有线的束缚，携带使用更方便。', 1, NULL, NULL, '数码专题');
INSERT INTO `cms_subject` VALUES (15, 5, '今冬潮包look，凹出绚丽女王范', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t8365/191/1901440450/575969/c71560c9/59c3144dNe6d8dd2f.png', NULL, 1, '2019-01-29 13:15:12', 100, 1000, 100, NULL, '潮流时尚的美包，搭配潮服，会让你魅力一直在线。因为潮包一直是女性出游扮美的秘籍，它不仅能够帮你收纳日常小物件，还能让你解放双手，这里推荐的时尚美包，随意搭配一件服饰，都可以让你潮范十足，凹出绚丽女王范。', 1, NULL, NULL, '服饰专题');

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
INSERT INTO `cms_subject_category` VALUES (1, '精选专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jingxuan.png', 3, 1, 100);
INSERT INTO `cms_subject_category` VALUES (2, '家电专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', 7, 1, 0);
INSERT INTO `cms_subject_category` VALUES (3, '美食专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_meishi.png', 3, 1, 0);
INSERT INTO `cms_subject_category` VALUES (4, '数码专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png', 1, 1, 0);
INSERT INTO `cms_subject_category` VALUES (5, '服饰专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', 1, 1, 0);

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题商品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
INSERT INTO `cms_subject_product_relation` VALUES (1, 1, 26);
INSERT INTO `cms_subject_product_relation` VALUES (2, 1, 27);
INSERT INTO `cms_subject_product_relation` VALUES (3, 1, 28);
INSERT INTO `cms_subject_product_relation` VALUES (4, 1, 29);
INSERT INTO `cms_subject_product_relation` VALUES (6, 2, 31);
INSERT INTO `cms_subject_product_relation` VALUES (7, 2, 35);
INSERT INTO `cms_subject_product_relation` VALUES (29, 2, 36);
INSERT INTO `cms_subject_product_relation` VALUES (30, 2, 32);
INSERT INTO `cms_subject_product_relation` VALUES (31, 3, 33);
INSERT INTO `cms_subject_product_relation` VALUES (38, 3, 34);
INSERT INTO `cms_subject_product_relation` VALUES (41, 2, 30);

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `attend_count` int(11) NULL DEFAULT NULL COMMENT '参与人数',
  `attention_count` int(11) NULL DEFAULT NULL COMMENT '关注人数',
  `read_count` int(11) NULL DEFAULT NULL,
  `award_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参与方式',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '话题内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `topic_id` bigint(20) NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('api-gateway', 'order-service,product-service,member-service', '$2a$10$vrIjbiA99pqEIXR08dbLVuSQSEYHGZ7Pn51P/iBoHtshii5jUdp9G', 'read,write', 'password', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('member-service', NULL, '$2a$10$vrIjbiA99pqEIXR08dbLVuSQSEYHGZ7Pn51P/iBoHtshii5jUdp9G', 'read,write,test', 'password,refresh_token', NULL, NULL, 86400, 9999999, NULL, 'true');
INSERT INTO `oauth_client_details` VALUES ('order_app', 'order-service', '$2a$10$vrIjbiA99pqEIXR08dbLVuSQSEYHGZ7Pn51P/iBoHtshii5jUdp9G', 'read', 'password', '', NULL, 86400, NULL, NULL, '');
INSERT INTO `oauth_client_details` VALUES ('portal_app', 'order-service,product-service,api-gateway,authorize-server', '$2a$10$E.QABsfckMmlX2W81iqRbuLfnIVfJoGD1nWuYZj0k8ZCPuFqFY2Pu', 'read,write', 'password,authorization_code,refresh_token', 'http://portal.tuling.com:8855/callBack', NULL, 86400, 3600, NULL, 'true');
INSERT INTO `oauth_client_details` VALUES ('product_app', 'product-service', '$2a$10$vrIjbiA99pqEIXR08dbLVuSQSEYHGZ7Pn51P/iBoHtshii5jUdp9G', 'read,write', 'password', NULL, NULL, 86400, NULL, NULL, '');

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_sku_id` bigint(20) NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '添加到购物车的价格',
  `sp1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性2',
  `sp3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性3',
  `product_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
INSERT INTO `oms_cart_item` VALUES (12, 26, 90, 1, 1, 3788.00, '金色', '16G', NULL, NULL, '华为 HUAWEI P20', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2018-08-27 16:53:44', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (13, 27, 98, 1, 3, 2699.00, '黑色', '32G', NULL, NULL, '小米8', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2018-08-27 17:11:53', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (14, 28, 102, 1, 39, 649.00, '金色', '16G', NULL, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-27 17:18:02', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (15, 28, 103, 1, 3, 699.00, '金色', '32G', NULL, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-28 10:22:45', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (16, 29, 106, 1, 6, 5499.00, '金色', '32G', NULL, NULL, 'Apple iPhone 8 Plus', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2018-08-28 10:50:50', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (17, 26, 92, 1, 23, 3788.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026003', 'windir', '2020-01-15 07:23:58', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (18, 26, 93, 1, 4, 3999.00, '银色', '32G', NULL, NULL, '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', NULL, 'windir', '2020-01-16 09:15:23', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (41, 28, 0, 1, 1, 649.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', NULL, 'windir', '2020-02-28 12:14:36', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (42, 11, 0, 1, 2, 249.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '女式超柔软拉毛运动开衫1', '匠心剪裁，垂感质地', NULL, 'windir', '2020-02-28 12:14:48', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (43, 38, 126, 1, 1, 2199.00, '樱雪晴空', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_42B09549789695A42D621CF87DC53B5EBE9385772DC61FB9mp.png', '华为nova6se 手机 绮境森林 全网通（8G+128G)', '华为nova6se 手机 绮境森林 全网通（8G+128G)', NULL, 'windir', '2020-03-17 05:39:55', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (44, 27, 98, 10, 1, 2699.00, '黑色', '32G', NULL, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', NULL, 'yangguo', '2020-03-17 06:13:46', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (45, 27, 99, 1, 1, 2999.00, '黑色', '64G', NULL, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', NULL, 'windir', '2020-03-18 13:43:45', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (46, 38, 122, 1, 1, 2199.00, '幻夜黑', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_AB008D014A661DF6E52E184269C6A8A453885402D7D6FC0Bmp.png', '华为nova6se 手机 绮境森林 全网通（8G+128G)', '华为nova6se 手机 绮境森林 全网通（8G+128G)', NULL, 'windir', '2020-03-27 09:08:33', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (47, 41, 140, 1, 1, 7999.00, NULL, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/1_DE7F785A7E0C276D3A1F40A5C6D82B07D2AED60CE1F73795mp.png', '华为P40 Pro', '华为P40 Pro', NULL, 'windir', '2020-03-27 13:25:59', NULL, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址名称',
  `send_status` int(1) NULL DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(1) NULL DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司收发货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
INSERT INTO `oms_company_address` VALUES (1, '深圳发货点', 1, 1, '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (2, '北京发货点', 0, 0, '大梨', '18000000000', '北京市', NULL, '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (3, '南京发货点', 0, 0, '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(1) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(1) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ordersn`(`order_sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (12, 1, 2, '201809150101000001', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 20.00, 2344.25, 0.00, 10.00, 10.00, 0, 1, 4, 0, '', '', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '江苏省', '常州市', '天宁区', '东晓街道', 'xxx', 0, 0, NULL, NULL, NULL, NULL, NULL, '2018-10-30 14:43:49', NULL);
INSERT INTO `oms_order` VALUES (13, 1, 2, '201809150102000002', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '75322652540210', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, '2018-10-11 14:04:19', '2019-12-25 06:00:49', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (14, 1, 2, '201809130101000001', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, '顺丰快递', '201707196398345', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2018-10-13 13:44:04', '2018-10-16 13:43:41', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (15, 1, 2, '201809130102000002', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, '顺丰快递', '201707196398346', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2018-10-13 13:44:54', '2018-10-16 13:45:01', '2018-10-18 14:05:31', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (16, 1, 2, '201809140101000001', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (17, 1, 2, '201809150101000003', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (18, 1, 2, '201809150102000004', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 2, 0, '中通快递', '75322652540210', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, NULL, '2019-12-25 06:02:07', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (19, 1, 2, '201809130101000003', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (20, 1, 2, '201809130102000004', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (21, 1, 2, '201809140101000002', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (22, 1, 2, '201809150101000005', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (23, 1, 2, '201809150102000006', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 1, 0, '顺丰快递', 'xxx', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, NULL, '2018-10-16 14:41:28', NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (24, 1, 2, '201809130101000005', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (25, 1, 2, '201809130102000006', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 10.00, 2344.25, 0.00, 10.00, 5.00, 1, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨22', '18033441849', '518000', '北京市', '北京城区', '东城区', '东城街道', 'xxx', 0, 0, NULL, NULL, NULL, NULL, NULL, '2018-10-30 15:08:31', NULL);
INSERT INTO `oms_order` VALUES (30, 1, NULL, '202001100102000001', '2020-01-10 13:05:54', 'test', 11885.00, 9660.75, 0.00, 2224.25, 0.00, 0.00, 0.00, 0, 1, 4, 0, NULL, NULL, NULL, 11885, 11885, '单品促销,打折优惠：满3件，打7.50折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (31, 1, NULL, '202002270001000001', '2020-02-27 07:01:58', 'test', 1999.00, 1999.00, 0.00, 0.00, 0.00, NULL, 700.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-31.png');
INSERT INTO `oms_order` VALUES (32, 1, NULL, '202002270001000002', '2020-02-27 07:14:21', 'test', 1999.00, 1999.00, 0.00, 0.00, 0.00, NULL, 600.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-32.png');
INSERT INTO `oms_order` VALUES (33, 1, NULL, '202003040001000001', '2020-03-04 06:18:57', 'test', 1999.00, 1999.00, 0.00, 0.00, 0.00, NULL, 700.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (34, 1, NULL, '202003040001000002', '2020-03-04 06:21:35', 'test', 1999.00, 1999.00, 0.00, 0.00, 0.00, NULL, 700.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (35, 1, NULL, '202003040001000003', '2020-03-04 06:25:36', 'test', 1999.00, 1999.00, 0.00, 0.00, 0.00, NULL, 700.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (36, 1, NULL, '202003040001000004', '2020-03-04 06:28:46', 'test', 1999.00, 1999.00, 0.00, 0.00, 0.00, NULL, 700.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (37, 1, NULL, '202003040001000005', '2020-03-04 06:31:32', 'test', 1999.00, 1999.00, 0.00, 0.00, 0.00, NULL, 700.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (38, 1, NULL, '202003040001000006', '2020-03-04 06:38:27', 'test', 1999.00, 1999.00, 0.00, 0.00, 0.00, NULL, 700.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-38.png');
INSERT INTO `oms_order` VALUES (39, 1, NULL, '202003170101000001', '2020-03-17 06:49:19', 'test', 2199.00, 2199.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 1000, 69, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (40, 1, NULL, '202003180101000001', '2020-03-18 13:44:00', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (41, 12, NULL, '202004210001000005', '2020-04-21 08:54:15', 'yangguo1', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (42, 12, NULL, '202004210001000006', '2020-04-21 09:18:00', 'yangguo1', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (43, 12, NULL, '202004210001000007', '2020-04-21 09:20:43', 'yangguo1', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (44, 14, NULL, '202004210001000008', '2020-04-21 09:20:43', 'yangguo3', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (45, 15, NULL, '202004210001000009', '2020-04-21 09:20:43', 'yangguo4', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (46, 13, NULL, '202004210001000011', '2020-04-21 09:20:43', 'yangguo2', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (47, 16, NULL, '202004210001000010', '2020-04-21 09:20:43', 'yangguo5', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (48, 18, NULL, '202004210001000012', '2020-04-21 09:20:43', 'yangguo7', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (49, 17, NULL, '202004210001000013', '2020-04-21 09:20:43', 'yangguo6', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (50, 12, NULL, '202004220001000001', '2020-04-22 09:10:38', 'yangguo1', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (52, 161, NULL, '202004220001000077', '2020-04-22 12:35:10', 'yangguo150', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (53, 21, NULL, '202004220001000084', '2020-04-22 12:35:10', 'yangguo10', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (54, 24, NULL, '202004220001000080', '2020-04-22 12:35:10', 'yangguo13', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (55, 202, NULL, '202004220001000071', '2020-04-22 12:35:10', 'yangguo191', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (56, 82, NULL, '202004220001000093', '2020-04-22 12:35:10', 'yangguo71', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (57, 39, NULL, '202004220001000072', '2020-04-22 12:35:10', 'yangguo28', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (58, 78, NULL, '202004220001000095', '2020-04-22 12:35:10', 'yangguo67', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (59, 79, NULL, '202004220001000092', '2020-04-22 12:35:10', 'yangguo68', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (60, 97, NULL, '202004220001000091', '2020-04-22 12:35:10', 'yangguo86', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (61, 46, NULL, '202004220001000057', '2020-04-22 12:35:10', 'yangguo35', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (62, 154, NULL, '202004220001000066', '2020-04-22 12:35:10', 'yangguo143', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (63, 104, NULL, '202004220001000083', '2020-04-22 12:35:10', 'yangguo93', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (64, 136, NULL, '202004220001000099', '2020-04-22 12:35:10', 'yangguo125', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (65, 30, NULL, '202004220001000100', '2020-04-22 12:35:10', 'yangguo19', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (66, 151, NULL, '202004220001000082', '2020-04-22 12:35:10', 'yangguo140', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (67, 29, NULL, '202004220001000090', '2020-04-22 12:35:10', 'yangguo18', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (68, 70, NULL, '202004220001000078', '2020-04-22 12:35:10', 'yangguo59', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (69, 77, NULL, '202004220001000098', '2020-04-22 12:35:10', 'yangguo66', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (70, 52, NULL, '202004220001000069', '2020-04-22 12:35:10', 'yangguo41', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (71, 95, NULL, '202004220001000073', '2020-04-22 12:35:10', 'yangguo84', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (72, 195, NULL, '202004220001000097', '2020-04-22 12:35:10', 'yangguo184', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (73, 38, NULL, '202004220001000096', '2020-04-22 12:35:10', 'yangguo27', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (74, 51, NULL, '202004220001000094', '2020-04-22 12:35:10', 'yangguo40', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (75, 66, NULL, '202004220001000088', '2020-04-22 12:35:10', 'yangguo55', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (76, 156, NULL, '202004220001000079', '2020-04-22 12:35:10', 'yangguo145', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (77, 26, NULL, '202004220001000086', '2020-04-22 12:35:10', 'yangguo15', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (78, 54, NULL, '202004220001000081', '2020-04-22 12:35:10', 'yangguo43', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (79, 16, NULL, '202004220001000075', '2020-04-22 12:35:10', 'yangguo5', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (80, 180, NULL, '202004220001000068', '2020-04-22 12:35:10', 'yangguo169', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (81, 183, NULL, '202004220001000074', '2020-04-22 12:35:10', 'yangguo172', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (82, 49, NULL, '202004220001000064', '2020-04-22 12:35:10', 'yangguo38', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (83, 130, NULL, '202004220001000056', '2020-04-22 12:35:10', 'yangguo119', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (84, 135, NULL, '202004220001000063', '2020-04-22 12:35:10', 'yangguo124', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (85, 85, NULL, '202004220001000052', '2020-04-22 12:35:10', 'yangguo74', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (86, 111, NULL, '202004220001000037', '2020-04-22 12:35:10', 'yangguo100', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (87, 134, NULL, '202004220001000036', '2020-04-22 12:35:10', 'yangguo123', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (88, 59, NULL, '202004220001000035', '2020-04-22 12:35:10', 'yangguo48', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (89, 197, NULL, '202004220001000032', '2020-04-22 12:35:10', 'yangguo186', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (90, 170, NULL, '202004220001000026', '2020-04-22 12:35:10', 'yangguo159', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (91, 42, NULL, '202004220001000019', '2020-04-22 12:35:09', 'yangguo31', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (92, 63, NULL, '202004220001000018', '2020-04-22 12:35:09', 'yangguo52', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (93, 117, NULL, '202004220001000014', '2020-04-22 12:35:09', 'yangguo106', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (94, 22, NULL, '202004220001000009', '2020-04-22 12:35:09', 'yangguo11', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (95, 155, NULL, '202004220001000008', '2020-04-22 12:35:09', 'yangguo144', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (96, 164, NULL, '202004220001000003', '2020-04-22 12:35:08', 'yangguo153', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (97, 162, NULL, '202004220001000060', '2020-04-22 12:35:10', 'yangguo151', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (98, 126, NULL, '202004220001000053', '2020-04-22 12:35:10', 'yangguo115', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (99, 83, NULL, '202004220001000054', '2020-04-22 12:35:10', 'yangguo72', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (100, 76, NULL, '202004220001000061', '2020-04-22 12:35:10', 'yangguo65', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (101, 179, NULL, '202004220001000047', '2020-04-22 12:35:10', 'yangguo168', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (102, 123, NULL, '202004220001000045', '2020-04-22 12:35:10', 'yangguo112', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (103, 14, NULL, '202004220001000043', '2020-04-22 12:35:10', 'yangguo3', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (104, 101, NULL, '202004220001000038', '2020-04-22 12:35:10', 'yangguo90', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (105, 159, NULL, '202004220001000034', '2020-04-22 12:35:10', 'yangguo148', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (106, 140, NULL, '202004220001000033', '2020-04-22 12:35:10', 'yangguo129', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (107, 55, NULL, '202004220001000030', '2020-04-22 12:35:10', 'yangguo44', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (108, 13, NULL, '202004220001000028', '2020-04-22 12:35:10', 'yangguo2', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (109, 122, NULL, '202004220001000027', '2020-04-22 12:35:10', 'yangguo111', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (110, 181, NULL, '202004220001000020', '2020-04-22 12:35:09', 'yangguo170', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (111, 132, NULL, '202004220001000015', '2020-04-22 12:35:09', 'yangguo121', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (112, 116, NULL, '202004220001000012', '2020-04-22 12:35:09', 'yangguo105', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (113, 125, NULL, '202004220001000007', '2020-04-22 12:35:09', 'yangguo114', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (114, 138, NULL, '202004220001000005', '2020-04-22 12:35:09', 'yangguo127', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (115, 175, NULL, '202004220001000006', '2020-04-22 12:35:09', 'yangguo164', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (116, 64, NULL, '202004220001000002', '2020-04-22 12:35:07', 'yangguo53', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (117, 32, NULL, '202004220001000087', '2020-04-22 12:35:10', 'yangguo21', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (118, 25, NULL, '202004220001000089', '2020-04-22 12:35:10', 'yangguo14', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (119, 119, NULL, '202004220001000085', '2020-04-22 12:35:10', 'yangguo108', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (120, 209, NULL, '202004220001000070', '2020-04-22 12:35:10', 'yangguo198', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (121, 106, NULL, '202004220001000067', '2020-04-22 12:35:10', 'yangguo95', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (122, 69, NULL, '202004220001000076', '2020-04-22 12:35:10', 'yangguo58', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (123, 33, NULL, '202004220001000065', '2020-04-22 12:35:10', 'yangguo22', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (124, 67, NULL, '202004220001000058', '2020-04-22 12:35:10', 'yangguo56', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (125, 99, NULL, '202004220001000059', '2020-04-22 12:35:10', 'yangguo88', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (126, 103, NULL, '202004220001000062', '2020-04-22 12:35:10', 'yangguo92', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (127, 149, NULL, '202004220001000050', '2020-04-22 12:35:10', 'yangguo138', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (128, 108, NULL, '202004220001000046', '2020-04-22 12:35:10', 'yangguo97', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (129, 118, NULL, '202004220001000042', '2020-04-22 12:35:10', 'yangguo107', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (130, 192, NULL, '202004220001000039', '2020-04-22 12:35:10', 'yangguo181', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (131, 40, NULL, '202004220001000031', '2020-04-22 12:35:10', 'yangguo29', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (132, 41, NULL, '202004220001000025', '2020-04-22 12:35:10', 'yangguo30', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (133, 96, NULL, '202004220001000024', '2020-04-22 12:35:10', 'yangguo85', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (134, 35, NULL, '202004220001000022', '2020-04-22 12:35:10', 'yangguo24', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (135, 189, NULL, '202004220001000016', '2020-04-22 12:35:09', 'yangguo178', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (136, 80, NULL, '202004220001000021', '2020-04-22 12:35:09', 'yangguo69', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (137, 87, NULL, '202004220001000013', '2020-04-22 12:35:09', 'yangguo76', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (138, 139, NULL, '202004220001000010', '2020-04-22 12:35:09', 'yangguo128', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (139, 188, NULL, '202004220001000055', '2020-04-22 12:35:10', 'yangguo177', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (140, 129, NULL, '202004220001000049', '2020-04-22 12:35:10', 'yangguo118', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (141, 127, NULL, '202004220001000048', '2020-04-22 12:35:10', 'yangguo116', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (142, 204, NULL, '202004220001000051', '2020-04-22 12:35:10', 'yangguo193', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (143, 145, NULL, '202004220001000044', '2020-04-22 12:35:10', 'yangguo134', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (144, 147, NULL, '202004220001000041', '2020-04-22 12:35:10', 'yangguo136', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (145, 182, NULL, '202004220001000040', '2020-04-22 12:35:10', 'yangguo171', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (146, 157, NULL, '202004220001000029', '2020-04-22 12:35:10', 'yangguo146', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (147, 190, NULL, '202004220001000023', '2020-04-22 12:35:10', 'yangguo179', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (148, 84, NULL, '202004220001000017', '2020-04-22 12:35:09', 'yangguo73', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (149, 186, NULL, '202004220001000011', '2020-04-22 12:35:09', 'yangguo175', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (150, 113, NULL, '202004220001000004', '2020-04-22 12:35:09', 'yangguo102', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (151, 799, NULL, '202004220001000101', '2020-04-22 12:35:16', 'yangguo788', 2599.00, 2599.00, 0.00, 0.00, 0.00, NULL, 100.00, 1, 0, 4, 1, NULL, NULL, NULL, 2699, 2699, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) NULL DEFAULT 0,
  `gift_growth` int(11) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单中所包含的商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES (21, 12, '201809150101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (22, 12, '201809150101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (23, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (24, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (25, 12, '201809150101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (26, 13, '201809150102000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (27, 13, '201809150102000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (28, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (29, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (30, 13, '201809150102000002', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (31, 14, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (32, 14, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (33, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (34, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (35, 14, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (36, 15, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (37, 15, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (38, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (39, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (40, 15, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (41, 16, '201809140101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (42, 16, '201809140101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (43, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (44, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (45, 16, '201809140101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (46, 30, '202001100102000001', 26, NULL, '华为 HUAWEI P20', NULL, NULL, 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 0.00, 0.00, 3588.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (47, 30, '202001100102000001', 27, NULL, '小米8', NULL, NULL, 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 0.00, 0.00, 2024.25, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (48, 31, '202002270001000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 1999.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 1999.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (49, 32, '202002270001000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 1999.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 1999.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (50, 33, '202003040001000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 1999.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 1999.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (51, 34, '202003040001000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 1999.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 1999.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (52, 35, '202003040001000003', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 1999.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 1999.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (53, 36, '202003040001000004', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 1999.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 1999.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (54, 37, '202003040001000005', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 1999.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 1999.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (55, 38, '202003040001000006', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 1999.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 1999.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (56, 39, '202003170101000001', 38, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_42B09549789695A42D621CF87DC53B5EBE9385772DC61FB9mp.png', '华为nova6se 手机 绮境森林 全网通（8G+128G)', NULL, NULL, 2199.00, 1, 126, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2199.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (57, 40, '202003180101000001', 27, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', NULL, NULL, 2999.00, 1, 99, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (58, 41, '202004210001000005', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (59, 42, '202004210001000006', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (60, 43, '202004210001000007', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (61, 44, '202004210001000008', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (62, 45, '202004210001000009', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (63, 46, '202004210001000011', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (64, 47, '202004210001000010', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (65, 48, '202004210001000012', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (66, 49, '202004210001000013', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (67, 50, '202004220001000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (68, 52, '202004220001000077', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (69, 53, '202004220001000084', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (70, 54, '202004220001000080', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (71, 55, '202004220001000071', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (72, 56, '202004220001000093', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (73, 57, '202004220001000072', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (74, 58, '202004220001000095', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (75, 59, '202004220001000092', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (76, 60, '202004220001000091', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (77, 61, '202004220001000057', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (78, 62, '202004220001000066', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (79, 63, '202004220001000083', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (80, 64, '202004220001000099', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (81, 65, '202004220001000100', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (82, 66, '202004220001000082', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (83, 67, '202004220001000090', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (84, 68, '202004220001000078', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (85, 69, '202004220001000098', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (86, 70, '202004220001000069', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (87, 71, '202004220001000073', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (88, 72, '202004220001000097', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (89, 73, '202004220001000096', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (90, 74, '202004220001000094', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (91, 75, '202004220001000088', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (92, 76, '202004220001000079', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (93, 77, '202004220001000086', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (94, 78, '202004220001000081', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (95, 79, '202004220001000075', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (96, 80, '202004220001000068', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (97, 81, '202004220001000074', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (98, 82, '202004220001000064', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (99, 83, '202004220001000056', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (100, 84, '202004220001000063', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (101, 85, '202004220001000052', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (102, 86, '202004220001000037', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (103, 87, '202004220001000036', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (104, 88, '202004220001000035', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (105, 89, '202004220001000032', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (106, 90, '202004220001000026', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (107, 91, '202004220001000019', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (108, 92, '202004220001000018', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (109, 93, '202004220001000014', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (110, 94, '202004220001000009', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (111, 95, '202004220001000008', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (112, 96, '202004220001000003', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (113, 97, '202004220001000060', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (114, 98, '202004220001000053', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (115, 99, '202004220001000054', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (116, 100, '202004220001000061', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (117, 101, '202004220001000047', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (118, 102, '202004220001000045', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (119, 103, '202004220001000043', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (120, 104, '202004220001000038', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (121, 105, '202004220001000034', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (122, 106, '202004220001000033', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (123, 107, '202004220001000030', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (124, 108, '202004220001000028', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (125, 109, '202004220001000027', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (126, 110, '202004220001000020', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (127, 111, '202004220001000015', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (128, 112, '202004220001000012', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (129, 113, '202004220001000007', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (130, 114, '202004220001000005', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (131, 115, '202004220001000006', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (132, 116, '202004220001000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (133, 117, '202004220001000087', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (134, 118, '202004220001000089', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (135, 119, '202004220001000085', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (136, 120, '202004220001000070', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (137, 121, '202004220001000067', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (138, 122, '202004220001000076', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (139, 123, '202004220001000065', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (140, 124, '202004220001000058', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (141, 125, '202004220001000059', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (142, 126, '202004220001000062', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (143, 127, '202004220001000050', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (144, 128, '202004220001000046', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (145, 129, '202004220001000042', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (146, 130, '202004220001000039', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (147, 131, '202004220001000031', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (148, 132, '202004220001000025', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (149, 133, '202004220001000024', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (150, 134, '202004220001000022', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (151, 135, '202004220001000016', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (152, 136, '202004220001000021', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (153, 137, '202004220001000013', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (154, 138, '202004220001000010', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (155, 139, '202004220001000055', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (156, 140, '202004220001000049', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (157, 141, '202004220001000048', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (158, 142, '202004220001000051', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (159, 143, '202004220001000044', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (160, 144, '202004220001000041', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (161, 145, '202004220001000040', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (162, 146, '202004220001000029', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (163, 147, '202004220001000023', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (164, 148, '202004220001000017', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (165, 149, '202004220001000011', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (166, 150, '202004220001000004', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);
INSERT INTO `oms_order_item` VALUES (167, 151, '202004220001000101', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2599.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 2599.00, 2699, 2699, NULL);

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作历史记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
INSERT INTO `oms_order_operate_history` VALUES (5, 12, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (6, 13, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (7, 12, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (8, 13, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (9, 22, '后台管理员', '2018-10-15 16:31:48', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (10, 22, '后台管理员', '2018-10-15 16:35:08', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (11, 22, '后台管理员', '2018-10-15 16:35:59', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (12, 17, '后台管理员', '2018-10-15 16:43:40', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (13, 25, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (14, 26, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (15, 23, '后台管理员', '2018-10-16 14:41:28', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (16, 13, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (17, 18, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (18, 26, '后台管理员', '2018-10-30 14:37:44', 4, '订单关闭:关闭订单');
INSERT INTO `oms_order_operate_history` VALUES (19, 25, '后台管理员', '2018-10-30 15:07:01', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (20, 25, '后台管理员', '2018-10-30 15:08:13', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (21, 25, '后台管理员', '2018-10-30 15:08:31', 0, '修改备注信息：xxx');
INSERT INTO `oms_order_operate_history` VALUES (22, 25, '后台管理员', '2018-10-30 15:08:39', 4, '订单关闭:2222');
INSERT INTO `oms_order_operate_history` VALUES (23, 13, '后台管理员', '2019-12-25 14:00:49', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (24, 18, '后台管理员', '2019-12-25 14:02:06', 2, '完成发货');

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(20) NULL DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) NULL DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单退货申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
INSERT INTO `oms_order_return_apply` VALUES (3, 12, NULL, 26, '201809150101000001', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (4, 12, 2, 27, '201809150101000001', '2018-10-17 14:40:21', 'test', 3585.98, '大梨', '18000000000', 1, '2018-10-18 13:54:10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '已经处理了', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (5, 12, 3, 28, '201809150101000001', '2018-10-17 14:44:18', 'test', 3585.98, '大梨', '18000000000', 2, '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '已经处理了', 'admin', 'admin', '2018-10-18 13:55:58', '已经处理了');
INSERT INTO `oms_order_return_apply` VALUES (8, 13, NULL, 28, '201809150102000002', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 3, '2018-10-18 13:57:12', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '理由不够充分', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (9, 14, 2, 26, '201809130101000001', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '呵呵', 'admin', 'admin', '2018-10-24 15:46:35', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (10, 14, NULL, 27, '201809130101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '就是不退', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (11, 14, 2, 28, '201809130101000001', '2018-10-17 14:44:18', 'test', 591.05, '大梨', '18000000000', 1, '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '可以退款', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (12, 15, 3, 26, '201809130102000002', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '退货了', 'admin', 'admin', '2018-10-24 17:23:06', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (13, 15, NULL, 27, '201809130102000002', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '无法退货', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (15, 16, NULL, 26, '201809140101000001', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (16, 16, NULL, 27, '201809140101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (17, 16, NULL, 28, '201809140101000001', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (18, 17, NULL, 26, '201809150101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (19, 17, NULL, 27, '201809150101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (20, 17, NULL, 28, '201809150101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (21, 18, NULL, 26, '201809150102000004', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (22, 18, NULL, 27, '201809150102000004', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (23, 18, NULL, 28, '201809150102000004', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (24, 19, NULL, 26, '201809130101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (25, 19, NULL, 27, '201809130101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (26, 19, NULL, 28, '201809130101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货原因表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
INSERT INTO `oms_order_return_reason` VALUES (1, '质量问题', 1, 0, '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` VALUES (2, '尺码太大', 1, 1, '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` VALUES (3, '颜色不喜欢', 1, 1, '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` VALUES (4, '7天无理由退货', 1, 1, '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` VALUES (5, '价格问题', 1, 0, '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` VALUES (12, '发票问题', 0, 1, '2018-10-19 16:28:36');
INSERT INTO `oms_order_return_reason` VALUES (13, '其他问题', 0, 1, '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` VALUES (14, '物流问题', 0, 1, '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` VALUES (15, '售后问题', 0, 1, '2018-10-19 16:29:11');

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) NULL DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) NULL DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) NULL DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) NULL DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) NULL DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES (1, 60, 120, 15, 7, 7);

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_count` int(11) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '相册表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NULL DEFAULT NULL,
  `pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '画册图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `sort` int(11) NULL DEFAULT NULL,
  `factory_status` int(1) NULL DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) NULL DEFAULT NULL,
  `product_count` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) NULL DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '品牌故事',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1, '万和', 'W', 0, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg', '', 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (2, '三星', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg', NULL, '三星的故事');
INSERT INTO `pms_brand` VALUES (3, '华为', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/17f2dd9756d9d333bee8e60ce8c03e4c_222_222.jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (4, '格力', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/dc794e7e74121272bbe3ce9bc41ec8c3_222_222.jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (5, '方太', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (6, '小米', 'M', 500, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/1e34aef2a409119018a4c6258e39ecfb_222_222.png', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', '小米手机的故事');
INSERT INTO `pms_brand` VALUES (21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '', 'string');
INSERT INTO `pms_brand` VALUES (49, '七匹狼', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/18d8bc3eb13533fab466d702a0d3fd1f40345bcd.jpg', NULL, 'BOOB的故事');
INSERT INTO `pms_brand` VALUES (50, '海澜之家', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/99d3279f1029d32b929343b09d3c72de_222_222.jpg', '', '海澜之家的故事');
INSERT INTO `pms_brand` VALUES (51, '苹果', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '苹果的故事');
INSERT INTO `pms_brand` VALUES (58, 'NIKE', 'N', 0, 1, 1, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE的故事');
INSERT INTO `pms_brand` VALUES (59, '杨过', 'yangguo', 0, 1, 1, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/2b84746650fc122d67749a876c453619.png', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/2b84746650fc122d67749a876c453619.png', '杨过联合马云创建');

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `star` int(3) NULL DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL COMMENT '0->显示，1->隐藏',
  `product_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int(11) NULL DEFAULT NULL,
  `read_count` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_comment
-- ----------------------------
INSERT INTO `pms_comment` VALUES (1, 26, 'windir', '华为 HUAWEI P20', 0, '', '2020-02-09 08:58:31', 0, '', 0, 0, '东西还不错', '', NULL, 0);

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品评价回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------
INSERT INTO `pms_comment_replay` VALUES (1, 1, 'windir', NULL, '真的吗？那我可以买一个了', '2020-02-09 09:06:48', 0);

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `charge_type` int(1) NULL DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10, 2) NULL DEFAULT NULL,
  `continme_fee` decimal(10, 2) NULL DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运费模版' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_level_id` bigint(20) NULL DEFAULT NULL,
  `member_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 243 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品会员价格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
INSERT INTO `pms_member_price` VALUES (26, 7, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (27, 8, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (28, 9, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (29, 10, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (30, 11, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (31, 12, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (32, 13, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (33, 14, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (37, 18, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (44, 7, 2, 480.00, NULL);
INSERT INTO `pms_member_price` VALUES (45, 7, 3, 450.00, NULL);
INSERT INTO `pms_member_price` VALUES (52, 22, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (53, 22, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (54, 22, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (58, 24, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (59, 24, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (60, 24, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (112, 23, 1, 88.00, '黄金会员');
INSERT INTO `pms_member_price` VALUES (113, 23, 2, 88.00, '白金会员');
INSERT INTO `pms_member_price` VALUES (114, 23, 3, 66.00, '钻石会员');
INSERT INTO `pms_member_price` VALUES (142, 31, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (143, 31, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (144, 31, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (148, 32, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (149, 32, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (150, 32, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (154, 33, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (155, 33, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (156, 33, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (169, 36, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (170, 36, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (171, 36, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (172, 35, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (173, 35, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (174, 35, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (175, 34, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (176, 34, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (177, 34, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (186, 26, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (187, 26, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (188, 26, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (192, 27, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (193, 27, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (194, 27, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (195, 28, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (196, 28, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (197, 28, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (198, 29, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (199, 29, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (200, 29, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (207, 30, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (208, 30, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (209, 30, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (222, 38, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (223, 38, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (224, 38, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (225, 39, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (226, 39, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (227, 39, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (228, 40, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (229, 40, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (230, 40, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (237, 37, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (238, 37, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (239, 37, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (240, 41, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (241, 41, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (242, 41, 3, NULL, '钻石会员');

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `feight_template_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货号',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) NULL DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(1) NULL DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) NULL DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int(11) NULL DEFAULT 0 COMMENT '赠送的成长值',
  `gift_point` int(11) NULL DEFAULT 0 COMMENT '赠送的积分',
  `use_point_limit` int(11) NULL DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) NULL DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(1) NULL DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `album_pics` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情网页内容',
  `detail_mobile_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端网页详情',
  `promotion_start_time` datetime(0) NULL DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime(0) NULL DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(11) NULL DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(1) NULL DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (1, 49, 7, 0, 0, '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 1, 1, 1, 100, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '七匹狼', '外套');
INSERT INTO `pms_product` VALUES (2, 49, 7, 0, 0, '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤2', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', NULL, NULL, NULL, 0, '七匹狼', '外套');
INSERT INTO `pms_product` VALUES (3, 1, 7, 0, 0, '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤3', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (4, 1, 7, 0, 0, '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤4', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (5, 1, 7, 0, 0, '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', 1, 0, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤5', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (6, 1, 7, 0, 0, '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤6', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (7, 1, 7, 0, 1, '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (8, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (9, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (10, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (11, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (12, 1, 7, 0, 1, '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (13, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (14, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (18, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (23, 6, 19, 0, 1, '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', 1, 1, 1, 1, 0, 0, 0, 99.00, NULL, 99, 99, 1000, '毛衫测试11', 'xxx', 109.00, 100, 0, '件', 1000.00, 1, '1,2,3', '毛衫测试', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '毛衫测试', '毛衫测试', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>', '', NULL, NULL, 0, 2, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (24, 6, 7, 0, 4, '华为 HUAWEI P30', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'xxx', '', 0.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套');
INSERT INTO `pms_product` VALUES (26, 3, 19, 0, 4, '华为 HUAWEI P30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 0, 0, 0, 100, 0, 3788.00, NULL, 3788, 3788, 0, 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', 4288.00, 1000, 0, '件', 0.00, 1, '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '', NULL, NULL, 0, 1, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (27, 6, 19, 0, 3, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 1, 0, 0, 0, 0, 0, 2699.00, NULL, 2699, 2699, 0, '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 2699.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>', '', NULL, NULL, 0, 3, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (28, 6, 19, 0, 3, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 0, 0, 0, 0, 0, 649.00, NULL, 649, 649, 0, '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 4, '小米', '手机通讯');
INSERT INTO `pms_product` VALUES (29, 51, 19, 0, 3, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', 0, 1, 0, 0, 0, 0, 0, 5499.00, NULL, 5499, 5499, 0, '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', 5499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '苹果', '手机通讯');
INSERT INTO `pms_product` VALUES (30, 50, 8, 0, 1, 'HLA海澜之家简约动物印花短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', 'http://tulingmall.oss-cn-beijing.aliyuncs.com/tulingmall/images/20200305/QQ图片20191114194714.jpg', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (31, 50, 8, 0, 1, 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (32, 50, 8, 0, NULL, 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 0, 1, 0, 0, 0, 0, 0, 68.00, NULL, 0, 0, 0, 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '', 68.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (33, 6, 35, 0, NULL, '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 0, 1, 0, 0, 0, 0, 0, 2499.00, NULL, 0, 0, 0, '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 2499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码');
INSERT INTO `pms_product` VALUES (34, 6, 35, 0, NULL, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 0, 1, 0, 0, 0, 0, 0, 3999.00, NULL, 0, 0, 0, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 3999.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码');
INSERT INTO `pms_product` VALUES (35, 58, 29, 0, NULL, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', 369.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋');
INSERT INTO `pms_product` VALUES (36, 58, 29, 0, NULL, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', 0, 1, 1, 1, 0, 0, 0, 499.00, NULL, 0, 0, 0, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', 499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋');
INSERT INTO `pms_product` VALUES (37, 3, 19, 0, 3, '(华为)HUAWEI MateBook X Pro 2019款 13.9英寸3K触控全面屏 轻薄笔记本', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/800_800_1555752016264mp.png', '', 0, 1, 1, 1, 0, 0, 0, 7999.00, NULL, 5, 5, 5, '(华为)HUAWEI MateBook X Pro 2019款 13.9英寸3K触控全面屏 轻薄笔记本', '', 7999.00, 1000, 0, '件', 133.00, 0, '3', 'HUAWEI MateBook X Pro 2019款 13.9英寸', '', '', 'HUAWEI MateBook X Pro 2019款 13.9英寸', 'HUAWEI MateBook X Pro 2019款 13.9英寸', '<p><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/201907121110572544603 (1).jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/201907121110574365537.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/201907121110575085887.jpg\" /></p>', '', NULL, NULL, 0, 0, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (38, 3, 19, 0, 3, '华为nova6se 手机 绮境森林 全网通（8G+128G)', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_42B09549789695A42D621CF87DC53B5EBE9385772DC61FB9mp.png', '', 0, 1, 1, 1, 0, 0, 0, 2199.00, NULL, 69, 1000, 0, '华为nova6se 手机 绮境森林 全网通（8G+128G)', '青春版', 2299.00, 0, 0, '', 178.00, 0, '3', '', '商品具有中国强制性产品认证（CCC）编号，符合国家CCC认证标准。', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_5097A805644914DFE330ED65A0FC2DA41228E18F88AE627D.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_A02429A8BDFD9296CF4425299A6D4114D7008B0D234B0FD2.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_AB008D014A661DF6E52E184269C6A8A453885402D7D6FC0Bmp.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_FA50CDD2624930996E0E1AADFDE36D30BCA429AAE15C1163.png', '华为nova6se 手机 绮境森林 全网通（8G+128G)', '华为nova6se 手机 绮境森林 全网通（8G+128G)', '<p><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/1.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/2.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/3.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/4.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/5.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/6.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/7.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/8.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/9.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/10.jpg\" /></p>', '', NULL, NULL, 0, 0, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (39, 59, 30, 0, 4, 'iPhone7/6s/8钢化膜苹果8Plus全屏复盖抗蓝光防窥防偷看手机膜', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/6df99dab78bb2014.jpg', '', 0, 1, 1, 1, 0, 0, 0, 31.90, NULL, 5, 5, 0, 'iPhone7/6s/8钢化膜苹果8Plus全屏复盖抗蓝光防窥防偷看手机膜', '杨过-马云牌钢化膜', 31.90, 1000, 0, '张', 10.00, 0, '3', '', '', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/17244f7f7e8d496c.jpg,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/b32e689349a062cb.jpg', 'iPhone7/6s/8钢化膜苹果8Plus全屏复盖抗蓝光防窥防偷看手机膜', 'iPhone7/6s/8钢化膜苹果8Plus全屏复盖抗蓝光防窥防偷看手机膜', '<p>马云-杨过牌手机膜,防水防火抗暴击,你与首富的距离只差一块膜的厚度</p>\n<p><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/5a041acaN61fbf759.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/67a7bc034bd775f6.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/993de3eafa9297e9.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/5a041ab8Nee227de5.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/5a041ac4Ne4c86b08.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/fb940234cd80d172.jpg\" /></p>', '', NULL, NULL, 0, 0, '杨过', '手机配件');
INSERT INTO `pms_product` VALUES (40, 49, 8, 0, 1, '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '', 0, 1, 1, 1, 0, 0, 0, 139.00, NULL, 5, 5, 0, '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', 139.00, 1000, 0, '件', 200.00, 0, '3', '七匹狼短袖T恤', '', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/120c9e32ba692a2e.jpg,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/c6d444dae7235d47.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '<p>jack-ma同款T恤</p>\n<p><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/01-f749c132a4b313cb1.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/02-f749c132a4b313cb1.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/04-4620808b690441ab.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/05-e231e99b71c381a3.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/06-f394e86daff28cd8.jpg\" /></p>', '', NULL, NULL, 0, 4, '七匹狼', 'T恤');
INSERT INTO `pms_product` VALUES (41, 3, 19, 0, 3, '华为P40 Pro GG CC 杨过帅vs小龙女哈哈哈哈哈', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/1_DE7F785A7E0C276D3A1F40A5C6D82B07D2AED60CE1F73795mp.png', '', 0, 1, 0, 0, 0, 0, 0, 7999.00, NULL, 100, 100, 0, '华为P40 Pro', '华为P40 Pro', 7999.00, 100, 0, '台', 209.00, 0, '', 'p40', '', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/2_164565E3E3B05D72733B33D4729958ABBE3A55FCD6935A80.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/3_1A25C03E6231A9165A376271469674FB5DAAB1CF8C0AED7A.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/4_CA8A4EE1388761516493C8D99D64C22F69C469AD7AB52E90.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/5_6F1BFFCC2409D1AAFD7F1A79A9BA3D78588B9A5E6CE61D98.png', '华为P40 Pro', '华为P40 Pro', '<p><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/5AE3622E8098253D4653A38CA576E022F3D2FB71AA89F3C5.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/D4FF84AC83ECBB3A930DEC57B7EE34247E7800E0FB4BB7C9.jpg\" /></p>', '', NULL, NULL, 0, 0, '华为', '手机通讯');

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_type` int(1) NULL DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(1) NULL DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(1) NULL DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(1) NULL DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(1) NULL DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(1) NULL DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(1) NULL DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
INSERT INTO `pms_product_attribute` VALUES (1, 1, '尺寸', 2, 1, 'M,X,XL,2XL,3XL,4XL', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (7, 1, '颜色', 2, 1, '黑色,红色,白色,粉色', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (13, 0, '上市年份', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (14, 0, '上市年份1', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (15, 0, '上市年份2', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (16, 0, '上市年份3', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (17, 0, '上市年份4', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (18, 0, '上市年份5', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (19, 0, '适用对象', 1, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (20, 0, '适用对象1', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (21, 0, '适用对象3', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (24, 1, '商品编号', 1, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (25, 1, '适用季节', 1, 1, '春季,夏季,秋季,冬季', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (32, 2, '适用人群', 0, 1, '老年,青年,中年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (33, 2, '风格', 0, 1, '嘻哈风格,基础大众,商务正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (35, 2, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (37, 1, '适用人群', 1, 1, '儿童,青年,中年,老年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (38, 1, '上市时间', 1, 1, '2017年秋,2017年冬,2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (39, 1, '袖长', 1, 1, '短袖,长袖,中袖', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (40, 2, '尺码', 0, 1, '29,30,31,32,33,34', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (41, 2, '适用场景', 0, 1, '居家,运动,正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (42, 2, '上市时间', 0, 1, '2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (43, 3, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (44, 3, '容量', 0, 1, '16G,32G,64G,128G,256G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (45, 3, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (46, 3, '网络', 0, 1, '3G,4G', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (47, 3, '系统', 0, 1, 'Android,IOS', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (48, 3, '电池容量', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (49, 4, '手机膜-材料', 0, 1, '钢化,石英玻璃,普通', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (50, 4, '手机膜-厚度', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (51, 4, '手机膜-颜色', 0, 0, '', 0, 0, 0, 0, 1, 0);

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attribute_count` int(11) NULL DEFAULT 0 COMMENT '属性数量',
  `param_count` int(11) NULL DEFAULT 0 COMMENT '参数数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品属性分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
INSERT INTO `pms_product_attribute_category` VALUES (1, '服装-T恤', 2, 5);
INSERT INTO `pms_product_attribute_category` VALUES (2, '服装-裤装', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (3, '手机数码-手机通讯', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (4, '配件', 2, 1);
INSERT INTO `pms_product_attribute_category` VALUES (5, '居家', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (6, '洗护', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (10, '测试分类', 0, 0);

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_id` bigint(20) NULL DEFAULT NULL,
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 299 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储产品参数信息的表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
INSERT INTO `pms_product_attribute_value` VALUES (1, 9, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (2, 10, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (3, 11, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (4, 12, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (5, 13, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (6, 14, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (7, 18, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (8, 7, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (9, 7, 1, 'XL');
INSERT INTO `pms_product_attribute_value` VALUES (10, 7, 1, 'XXL');
INSERT INTO `pms_product_attribute_value` VALUES (11, 22, 7, 'x,xx');
INSERT INTO `pms_product_attribute_value` VALUES (12, 22, 24, 'no110');
INSERT INTO `pms_product_attribute_value` VALUES (13, 22, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (14, 22, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (15, 22, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (16, 22, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (124, 23, 7, '米白色,浅黄色');
INSERT INTO `pms_product_attribute_value` VALUES (125, 23, 24, 'no1098');
INSERT INTO `pms_product_attribute_value` VALUES (126, 23, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (127, 23, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (128, 23, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (129, 23, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (130, 1, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (131, 1, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (132, 1, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (133, 1, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (134, 1, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (135, 1, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (136, 1, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (137, 1, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (138, 1, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (139, 2, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (140, 2, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (141, 2, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (142, 2, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (143, 2, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (144, 2, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (145, 2, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (146, 2, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (147, 2, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (183, 31, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (184, 31, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (185, 31, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (186, 31, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (187, 31, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (203, 26, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (204, 26, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (205, 26, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (206, 26, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (207, 26, 48, '3000');
INSERT INTO `pms_product_attribute_value` VALUES (213, 27, 43, '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (214, 27, 45, '5.8');
INSERT INTO `pms_product_attribute_value` VALUES (215, 27, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (216, 27, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (217, 27, 48, '3000ml');
INSERT INTO `pms_product_attribute_value` VALUES (218, 28, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (219, 28, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (220, 28, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (221, 28, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (222, 28, 48, '2800ml');
INSERT INTO `pms_product_attribute_value` VALUES (223, 29, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (224, 29, 45, '4.7');
INSERT INTO `pms_product_attribute_value` VALUES (225, 29, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (226, 29, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (227, 29, 48, '1960ml');
INSERT INTO `pms_product_attribute_value` VALUES (239, 30, 7, '红色');
INSERT INTO `pms_product_attribute_value` VALUES (240, 30, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (241, 30, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (242, 30, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (243, 30, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (244, 30, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (265, 38, 43, '幻夜黑,奇幻森林,樱雪晴空');
INSERT INTO `pms_product_attribute_value` VALUES (266, 38, 45, '6.4英寸');
INSERT INTO `pms_product_attribute_value` VALUES (267, 38, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (268, 38, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (269, 38, 48, '4200mhA');
INSERT INTO `pms_product_attribute_value` VALUES (270, 39, 51, '黑色');
INSERT INTO `pms_product_attribute_value` VALUES (271, 39, 50, '50mm');
INSERT INTO `pms_product_attribute_value` VALUES (272, 40, 7, '白色');
INSERT INTO `pms_product_attribute_value` VALUES (273, 40, 24, 'jack-ma0102937');
INSERT INTO `pms_product_attribute_value` VALUES (274, 40, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (275, 40, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (276, 40, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (277, 40, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (288, 37, 43, '深空灰');
INSERT INTO `pms_product_attribute_value` VALUES (289, 37, 45, '6.4英寸');
INSERT INTO `pms_product_attribute_value` VALUES (290, 37, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (291, 37, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (292, 37, 48, '4200mhA');
INSERT INTO `pms_product_attribute_value` VALUES (294, 41, 43, '黑色,白色');
INSERT INTO `pms_product_attribute_value` VALUES (295, 41, 45, '6.4');
INSERT INTO `pms_product_attribute_value` VALUES (296, 41, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (297, 41, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (298, 41, 48, '5500MA');

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(1) NULL DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) NULL DEFAULT NULL,
  `product_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nav_status` int(1) NULL DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
INSERT INTO `pms_product_category` VALUES (1, 0, '服装', 0, 100, '件', 1, 1, 1, NULL, '服装', '服装分类');
INSERT INTO `pms_product_category` VALUES (2, 0, '手机数码', 0, 100, '件', 1, 1, 1, NULL, '手机数码', '手机数码');
INSERT INTO `pms_product_category` VALUES (3, 0, '家用电器', 0, 100, '件', 1, 1, 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', '家用电器', '家用电器');
INSERT INTO `pms_product_category` VALUES (4, 0, '家具家装', 0, 100, '件', 1, 1, 1, NULL, '家具家装', '家具家装');
INSERT INTO `pms_product_category` VALUES (5, 0, '汽车用品', 0, 100, '件', 1, 1, 1, NULL, '汽车用品', '汽车用品');
INSERT INTO `pms_product_category` VALUES (7, 1, '外套', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', '外套', '外套');
INSERT INTO `pms_product_category` VALUES (8, 1, 'T恤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_tshirt.png', 'T恤', 'T恤');
INSERT INTO `pms_product_category` VALUES (9, 1, '休闲裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xiuxianku.png', '休闲裤', '休闲裤');
INSERT INTO `pms_product_category` VALUES (10, 1, '牛仔裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_niuzaiku.png', '牛仔裤', '牛仔裤');
INSERT INTO `pms_product_category` VALUES (11, 1, '衬衫', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_chenshan.png', '衬衫', '衬衫分类');
INSERT INTO `pms_product_category` VALUES (13, 12, '家电子分类1', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (14, 12, '家电子分类2', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (19, 2, '手机通讯', 1, 0, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png', '手机通讯', '手机通讯');
INSERT INTO `pms_product_category` VALUES (29, 1, '男鞋', 1, 0, '', 0, 0, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xie.png', '', '');
INSERT INTO `pms_product_category` VALUES (30, 2, '手机配件', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', '手机配件', '手机配件');
INSERT INTO `pms_product_category` VALUES (31, 2, '摄影摄像', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_sheying.png', '', '');
INSERT INTO `pms_product_category` VALUES (32, 2, '影音娱乐', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '');
INSERT INTO `pms_product_category` VALUES (33, 2, '数码配件', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '');
INSERT INTO `pms_product_category` VALUES (34, 2, '智能设备', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_zhineng.png', '', '');
INSERT INTO `pms_product_category` VALUES (35, 3, '电视', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (36, 3, '空调', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (37, 3, '洗衣机', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (38, 3, '冰箱', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (39, 3, '厨卫大电', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (40, 3, '厨房小电', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (41, 3, '生活电器', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (42, 3, '个护健康', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (43, 4, '厨房卫浴', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (44, 4, '灯饰照明', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (45, 4, '五金工具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (46, 4, '卧室家具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (47, 4, '客厅家具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (48, 5, '全新整车', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (49, 5, '车载电器', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (50, 5, '维修保养', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (51, 5, '汽车装饰', 1, 0, '', 1, 1, 0, '', '', '');

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
INSERT INTO `pms_product_category_attribute_relation` VALUES (1, 24, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (5, 26, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (7, 28, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (9, 25, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (10, 25, 25);

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `full_price` decimal(10, 2) NULL DEFAULT NULL,
  `reduce_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品满减表(只针对同商品)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
INSERT INTO `pms_product_full_reduction` VALUES (1, 7, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (2, 8, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (3, 9, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (4, 10, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (5, 11, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (6, 12, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (7, 13, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (8, 14, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (9, 18, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (10, 7, 200.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (11, 7, 300.00, 100.00);
INSERT INTO `pms_product_full_reduction` VALUES (14, 22, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (16, 24, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (34, 23, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (44, 31, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (46, 32, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (48, 33, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (53, 36, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (54, 35, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (55, 34, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (57, 26, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (59, 27, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (60, 28, 500.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (61, 28, 1000.00, 120.00);
INSERT INTO `pms_product_full_reduction` VALUES (62, 29, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (65, 30, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (70, 38, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (71, 39, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (72, 40, 200.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (75, 37, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (76, 41, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品阶梯价格表(只针对同商品)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
INSERT INTO `pms_product_ladder` VALUES (1, 7, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (2, 8, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (3, 9, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (4, 10, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (5, 11, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (6, 12, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (7, 13, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (8, 14, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (12, 18, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (14, 7, 4, 0.60, 0.00);
INSERT INTO `pms_product_ladder` VALUES (15, 7, 5, 0.50, 0.00);
INSERT INTO `pms_product_ladder` VALUES (18, 22, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (20, 24, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (38, 23, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (48, 31, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (50, 32, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (52, 33, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (57, 36, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (58, 35, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (59, 34, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (61, 26, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (64, 27, 2, 0.80, 0.00);
INSERT INTO `pms_product_ladder` VALUES (65, 27, 3, 0.75, 0.00);
INSERT INTO `pms_product_ladder` VALUES (66, 28, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (67, 29, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (70, 30, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (75, 38, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (76, 39, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (77, 40, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (80, 37, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (81, 41, 0, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `price_old` decimal(10, 2) NULL DEFAULT NULL,
  `price_new` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_old` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_new` decimal(10, 2) NULL DEFAULT NULL,
  `gift_point_old` int(11) NULL DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int(11) NULL DEFAULT NULL,
  `use_point_limit_old` int(11) NULL DEFAULT NULL,
  `use_point_limit_new` int(11) NULL DEFAULT NULL,
  `operate_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `vertify_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `status` int(1) NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品审核记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
INSERT INTO `pms_product_vertify_record` VALUES (1, 1, '2018-04-27 16:36:41', 'test', 1, '验证通过');
INSERT INTO `pms_product_vertify_record` VALUES (2, 2, '2018-04-27 16:36:41', 'test', 1, '验证通过');

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编码',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT 0 COMMENT '库存',
  `lock_stock` int(11) NULL DEFAULT 0 COMMENT '锁定库存',
  `low_stock` int(11) NULL DEFAULT NULL COMMENT '预警库存',
  `sp1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单品促销价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku的库存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES (1, 7, '123456', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (2, 8, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (3, 9, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (4, 10, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (5, 11, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (6, 12, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (7, 13, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (8, 14, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (9, 18, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (10, 7, 'string', 0.00, 0, 0, 0, 'string', 'string', 'sp3', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (11, 7, 'string', 0.00, 0, 0, 0, 'string', 'string', 'sp33', 'string', 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (12, 22, '111', 99.00, 0, 0, NULL, 'x', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (13, 22, '112', 99.00, 0, 0, NULL, 'xx', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2018032614134591_20180326141345650 (4).png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (78, 23, '201806070023001', 99.00, 0, 0, NULL, '米白色', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (79, 23, '201806070023002', 99.00, 0, 0, NULL, '米白色', 'X', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (80, 23, '201806070023003', 99.00, 0, 0, NULL, '浅黄色', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (81, 23, '201806070023004', 99.00, 0, 0, NULL, '浅黄色', 'X', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (90, 26, '201806070026001', 3788.00, 499, -11, NULL, '金色', '16G', NULL, NULL, NULL, 3588.00);
INSERT INTO `pms_sku_stock` VALUES (91, 26, '201806070026002', 3999.00, 500, 0, NULL, '金色', '32G', NULL, NULL, NULL, 3799.00);
INSERT INTO `pms_sku_stock` VALUES (92, 26, '201806070026003', 3788.00, 500, 0, NULL, '银色', '16G', NULL, NULL, NULL, 3588.00);
INSERT INTO `pms_sku_stock` VALUES (93, 26, '201806070026004', 3999.00, 500, 0, NULL, '银色', '32G', NULL, NULL, NULL, 3799.00);
INSERT INTO `pms_sku_stock` VALUES (98, 27, '201808270027001', 2699.00, 97, -33, 5, '黑色', '32G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (99, 27, '201808270027002', 2999.00, 100, 0, NULL, '黑色', '64G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (100, 27, '201808270027003', 2699.00, 100, 0, NULL, '蓝色', '32G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (101, 27, '201808270027004', 2999.00, 100, 0, NULL, '蓝色', '64G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (102, 28, '201808270028001', 649.00, 99, -9, NULL, '金色', '16G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (103, 28, '201808270028002', 699.00, 100000, 1559, NULL, '金色', '32G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (104, 28, '201808270028003', 649.00, 100, 0, NULL, '银色', '16G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (105, 28, '201808270028004', 699.00, 100, 0, NULL, '银色', '32G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (106, 29, '201808270029001', 5499.00, 100000, 3119, NULL, '金色', '32G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (107, 29, '201808270029002', 6299.00, 100, 0, NULL, '金色', '64G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (108, 29, '201808270029003', 5499.00, 100, 0, NULL, '银色', '32G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (109, 29, '201808270029004', 6299.00, 100, 0, NULL, '银色', '64G', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (110, 34, '202003020010101', 3000.00, 1000, 0, 5, '黑色', '16g', NULL, NULL, 0, NULL);
INSERT INTO `pms_sku_stock` VALUES (112, 30, '1111', 111.00, 11, 0, 1, '红色', 'M', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (121, 38, '20200311', 2199.00, 100, 0, 1, '幻夜黑', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_AB008D014A661DF6E52E184269C6A8A453885402D7D6FC0Bmp.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (122, 38, '20200311', 2199.00, 100, 0, 1, '幻夜黑', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_AB008D014A661DF6E52E184269C6A8A453885402D7D6FC0Bmp.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (123, 38, '20200311', 2199.00, 100, 0, 1, '奇幻森林', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_5097A805644914DFE330ED65A0FC2DA41228E18F88AE627D.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (124, 38, '20200311', 2199.00, 100, 0, 1, '奇幻森林', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_5097A805644914DFE330ED65A0FC2DA41228E18F88AE627D.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (125, 38, '20200311', 2199.00, 100, 0, 1, '樱雪晴空', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_42B09549789695A42D621CF87DC53B5EBE9385772DC61FB9mp.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (126, 38, '20200311', 2199.00, 100, 0, 1, '樱雪晴空', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_42B09549789695A42D621CF87DC53B5EBE9385772DC61FB9mp.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (127, 39, '202003110039001', 28.80, 1000, 0, 1, '钢化', '黑色', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/6df99dab78bb2014.jpg', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (128, 39, '202003110039002', 28.80, 1000, 0, 1, '石英玻璃', '黑色', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/2e7114084535b9a2.jpg', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (129, 39, '202003110039003', 28.80, 1000, 0, 1, '普通', '黑色', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/b32e689349a062cb.jpg', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (130, 40, '202003110040001', 139.30, 100, 0, 5, '白色', 'XL', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/bd267b1b8082246a.jpg', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (131, 40, '202003110040002', 139.30, 100, 0, 5, '白色', 'X', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/bd267b1b8082246a.jpg', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (132, 40, '202003110040003', 139.30, 100, 0, 5, '白色', 'M', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/bd267b1b8082246a.jpg', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (137, 37, '202003170037001', 7999.00, 1000, 0, 10, '深空灰', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/800_800_1555751961085.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (138, 37, '202003170037002', 7999.00, 1000, 0, 10, '深空灰', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/800_800_1555751961085.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (139, 41, '202003270041001', 7980.00, 1000, 0, 10, '黑色', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/1_DE7F785A7E0C276D3A1F40A5C6D82B07D2AED60CE1F73795mp.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (140, 41, '202003270041002', 7980.00, 1000, 0, 10, '黑色', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/1_DE7F785A7E0C276D3A1F40A5C6D82B07D2AED60CE1F73795mp.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (141, 41, '202003270041003', 7980.00, 1000, 0, 10, '白色', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/2_164565E3E3B05D72733B33D4729958ABBE3A55FCD6935A80.png', NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (142, 41, '202003270041004', 7980.00, 1000, 0, 10, '白色', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/2_164565E3E3B05D72733B33D4729958ABBE3A55FCD6935A80.png', NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) NULL DEFAULT NULL COMMENT '优惠卷类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` int(1) NULL DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) NULL DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `use_type` int(1) NULL DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) NULL DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) NULL DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) NULL DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime(0) NULL DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠码',
  `member_level` int(1) NULL DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES (2, 0, '全品类通用券', 0, 92, 10.00, 1, 100.00, '2018-08-27 16:40:47', '2018-11-23 16:40:47', 0, '满100减10', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (3, 0, '小米手机专用券', 0, 92, 50.00, 1, 1000.00, '2018-08-27 16:40:47', '2018-11-16 16:40:47', 2, '小米手机专用优惠券', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (4, 0, '手机品类专用券', 0, 92, 300.00, 1, 2000.00, '2018-08-27 16:40:47', '2018-09-15 16:40:47', 1, '手机分类专用优惠券', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (7, 0, 'T恤分类专用优惠券', 0, 93, 50.00, 1, 500.00, '2018-08-27 16:40:47', '2018-08-15 16:40:47', 1, '满500减50', 100, 0, 7, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (8, 0, '新优惠券', 0, 100, 100.00, 1, 1000.00, '2018-11-08 00:00:00', '2018-11-27 00:00:00', 0, '测试', 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (9, 0, '全品类通用券', 0, 100, 5.00, 1, 100.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (10, 0, '全品类通用券', 0, 100, 15.00, 1, 200.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (11, 0, '全品类通用券', 0, 1000, 50.00, 1, 1000.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 1000, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (12, 0, '移动端全品类通用券', 1, 1, 10.00, 1, 100.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (22, 0, '华为手机专用', 0, 999, 999.00, 1, 2000.00, '2020-03-24 16:00:00', '2020-12-30 16:00:00', 2, NULL, 1000, 0, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `coupon_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int(1) NULL DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `use_status` int(1) NULL DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_coupon_id`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券使用、领取历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
INSERT INTO `sms_coupon_history` VALUES (12, 2, 4, '0340981248320004', 'zhensan', 1, '2018-11-12 14:16:50', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (13, 3, 4, '0342977234360004', 'zhensan', 1, '2018-11-12 14:17:10', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (14, 4, 4, '0343342928830004', 'zhensan', 1, '2018-11-12 14:17:13', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (15, 2, 5, '0351883832180005', 'lisi', 1, '2018-11-12 14:18:39', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (16, 3, 5, '0352201672680005', 'lisi', 1, '2018-11-12 14:18:42', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (17, 4, 5, '0352505810180005', 'lisi', 1, '2018-11-12 14:18:45', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (18, 2, 6, '0356114588380006', 'wangwu', 1, '2018-11-12 14:19:21', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (19, 3, 6, '0356382856920006', 'wangwu', 1, '2018-11-12 14:19:24', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (20, 4, 6, '0356656798470006', 'wangwu', 1, '2018-11-12 14:19:27', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (21, 2, 3, '0363644984620003', 'windy', 1, '2018-11-12 14:20:36', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (22, 3, 3, '0363932820300003', 'windy', 1, '2018-11-12 14:20:39', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (23, 4, 3, '0364238275840003', 'windy', 1, '2018-11-12 14:20:42', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (24, 2, 7, '0385034833070007', 'lion', 1, '2018-11-12 14:24:10', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (25, 3, 7, '0385350208650007', 'lion', 1, '2018-11-12 14:24:13', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (26, 4, 7, '0385632733900007', 'lion', 1, '2018-11-12 14:24:16', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (27, 2, 8, '0388779132990008', 'shari', 1, '2018-11-12 14:24:48', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (28, 3, 8, '0388943658810008', 'shari', 1, '2018-11-12 14:24:49', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (29, 4, 8, '0389069398320008', 'shari', 1, '2018-11-12 14:24:51', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (30, 2, 9, '0390753935250009', 'aewen', 1, '2018-11-12 14:25:08', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (31, 3, 9, '0390882954470009', 'aewen', 1, '2018-11-12 14:25:09', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (32, 4, 9, '0391025542810009', 'aewen', 1, '2018-11-12 14:25:10', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (36, 22, 1, '9924320362620001', 'windir', 1, '2020-03-27 08:53:57', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `product_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券和产品分类关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券和产品的关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_relation` VALUES (13, 22, 38, '华为nova6se 手机 绮境森林 全网通（8G+128G)', '');

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `status` int(1) NULL DEFAULT NULL COMMENT '上下线状态,1上线、0下线',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '秒杀时间段名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
INSERT INTO `sms_flash_promotion` VALUES (2, '春季家电家具疯狂秒杀1', '2019-01-28', '2019-01-15', 0, '2018-11-16 11:12:13');
INSERT INTO `sms_flash_promotion` VALUES (3, '前端测试专用活动', '2020-02-15', '2020-12-18', 1, '2018-11-16 11:11:31');
INSERT INTO `sms_flash_promotion` VALUES (4, '春季家电家具疯狂秒杀3', '2018-11-24', '2018-11-25', 0, '2018-11-16 11:12:19');
INSERT INTO `sms_flash_promotion` VALUES (5, '春季家电家具疯狂秒杀4', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:24');
INSERT INTO `sms_flash_promotion` VALUES (6, '春季家电家具疯狂秒杀5', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:31');
INSERT INTO `sms_flash_promotion` VALUES (7, '春季家电家具疯狂秒杀6', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:35');
INSERT INTO `sms_flash_promotion` VALUES (8, '春季家电家具疯狂秒杀7', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:39');
INSERT INTO `sms_flash_promotion` VALUES (9, '春季家电家具疯狂秒杀8', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:42');
INSERT INTO `sms_flash_promotion` VALUES (13, '测试', '2018-11-01', '2018-11-30', 0, '2018-11-19 10:34:24');

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subscribe_time` datetime(0) NULL DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购通知记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint(20) NULL DEFAULT NULL COMMENT '秒杀活动ID->关联sms_flash_promotion表',
  `flash_promotion_session_id` bigint(20) NULL DEFAULT NULL COMMENT '当前日期活动场次编号',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '产品ID',
  `flash_promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int(11) NULL DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int(11) NULL DEFAULT NULL COMMENT '每人限购数量',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品限时购与商品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
INSERT INTO `sms_flash_promotion_product_relation` VALUES (25, 3, 2, 31, 90.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (26, 3, 2, 32, 60.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (27, 3, 2, 33, 2299.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (28, 3, 2, 34, 3888.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (37, 3, 5, 26, 3688.00, 100, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (38, 3, 5, 27, 2599.00, 0, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (39, 3, 5, 28, 599.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (40, 3, 5, 29, 4999.00, 10, 1, 100);

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场次名称',
  `start_time` time(0) NULL DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time(0) NULL DEFAULT NULL COMMENT '每日结束时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购场次表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session` VALUES (1, '16:00场', '08:00:00', '10:00:33', 1, '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES (2, '18:00场', '10:00:00', '12:00:00', 1, '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES (3, '20:00场', '12:00:00', '14:00:00', 1, '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES (4, '10:00场', '02:00:00', '04:00:00', 1, '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES (5, '13:00场', '05:00:00', '07:00:00', 1, '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES (6, '18:00', '18:00:00', '20:00:00', 0, '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES (7, '20:00', '20:00:33', '21:00:33', 0, '2018-11-16 13:22:55');

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int(11) NULL DEFAULT NULL COMMENT '点击数',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页轮播广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
INSERT INTO `sms_home_advertise` VALUES (2, '夏季大热促销', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '2018-11-01 14:01:37', '2018-11-15 14:01:37', 0, 0, 0, NULL, '夏季大热促销', 0);
INSERT INTO `sms_home_advertise` VALUES (3, '夏季大热促销1', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', 0, 0, 0, NULL, '夏季大热促销1', 0);
INSERT INTO `sms_home_advertise` VALUES (4, '夏季大热促销2', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', 1, 0, 0, NULL, '夏季大热促销2', 0);
INSERT INTO `sms_home_advertise` VALUES (9, '电影推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2018-11-24 00:00:00', 1, 0, 0, 'www.baidu.com', '电影推荐广告', 100);
INSERT INTO `sms_home_advertise` VALUES (10, '汽车促销广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', 1, 0, 0, 'xxx', NULL, 99);
INSERT INTO `sms_home_advertise` VALUES (11, '汽车推荐广告', 1, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200318/201907121110574365537.jpg', '2018-11-13 00:00:00', '2020-12-30 00:00:00', 1, 0, 0, '39', NULL, 98);

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NULL DEFAULT NULL COMMENT '品牌ID[关联pms_brand品牌推荐]',
  `brand_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `recommend_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态:1推荐，0取消推荐',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
INSERT INTO `sms_home_brand` VALUES (1, 1, '万和', 1, 200);
INSERT INTO `sms_home_brand` VALUES (2, 2, '三星', 1, 0);
INSERT INTO `sms_home_brand` VALUES (6, 6, '小米', 1, 300);
INSERT INTO `sms_home_brand` VALUES (8, 5, '方太', 1, 100);
INSERT INTO `sms_home_brand` VALUES (32, 50, '海澜之家', 1, 0);
INSERT INTO `sms_home_brand` VALUES (33, 51, '苹果', 1, 0);
INSERT INTO `sms_home_brand` VALUES (35, 3, '华为', 1, 0);
INSERT INTO `sms_home_brand` VALUES (36, 4, '格力', 1, 0);
INSERT INTO `sms_home_brand` VALUES (37, 5, '方太', 1, 0);
INSERT INTO `sms_home_brand` VALUES (38, 1, '万和', 1, 0);
INSERT INTO `sms_home_brand` VALUES (39, 21, 'OPPO', 1, 1);

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新鲜好物表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
INSERT INTO `sms_home_new_product` VALUES (2, 27, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 1, 200);
INSERT INTO `sms_home_new_product` VALUES (8, 26, '华为 HUAWEI P20 ', 0, 0);
INSERT INTO `sms_home_new_product` VALUES (9, 27, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (10, 28, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 0, 0);
INSERT INTO `sms_home_new_product` VALUES (11, 29, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 0, 0);
INSERT INTO `sms_home_new_product` VALUES (12, 30, 'HLA海澜之家简约动物印花短袖T恤', 0, 0);
INSERT INTO `sms_home_new_product` VALUES (13, 38, '华为nova6se 手机 绮境森林 全网通（8G+128G)', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (14, 41, '华为P40 Pro', 1, 0);

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人气推荐商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
INSERT INTO `sms_home_recommend_product` VALUES (3, 26, '华为 HUAWEI P20 ', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (4, 27, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (5, 28, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (6, 29, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (7, 30, 'HLA海澜之家简约动物印花短袖T恤', 1, 100);

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `subject_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
INSERT INTO `sms_home_recommend_subject` VALUES (14, 1, 'polo衬衫的也时尚', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (15, 2, '大牌手机低价秒', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (16, 3, '晓龙845新品上市', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (17, 4, '夏天应该穿什么', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (18, 5, '夏季精选', 1, 100);
INSERT INTO `sms_home_recommend_subject` VALUES (19, 6, '品牌手机降价', 1, 0);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (1, 'test', '$2a$10$zUnskPAYscI1P4qQYICN.OvFU63eELVwqegx/thOqkxN2shB5KDEy', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '测试账号', NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1);
INSERT INTO `ums_admin` VALUES (3, 'admin', '$2a$10$HIukCOoyY2lk9FP8YSxWNuxPJIfXpORkOfpEP61yHiaM34m6TcMh6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/170157_yIl3_1767531.jpg', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-03-20 15:38:50', 1);

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES (5, 3, '2018-12-06 13:59:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (6, 3, '2018-12-17 13:23:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (7, 3, '2018-12-18 13:51:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (8, 3, '2018-12-18 13:51:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (9, 3, '2019-01-28 16:20:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (10, 3, '2019-01-29 09:16:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (11, 3, '2019-01-29 10:10:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (12, 3, '2019-02-18 11:03:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (13, 3, '2019-03-12 10:03:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (14, 3, '2019-03-12 10:06:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (15, 3, '2019-03-12 10:15:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (16, 3, '2019-03-20 15:35:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (17, 3, '2019-03-20 15:38:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (18, 3, '2019-12-24 06:32:15', '127.0.0.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (19, 3, '2019-12-24 06:47:35', '127.0.0.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (20, 3, '2019-12-25 08:43:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (21, 3, '2019-12-25 11:24:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (22, 3, '2019-12-25 11:33:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (23, 3, '2019-12-25 11:34:53', '127.0.0.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (24, 3, '2019-12-25 11:56:53', '127.0.0.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (25, 3, '2019-12-25 11:57:56', '127.0.0.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (26, 3, '2019-12-25 12:06:46', '127.0.0.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (27, 3, '2019-12-25 12:18:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (28, 3, '2019-12-25 12:18:57', '127.0.0.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (29, 3, '2019-12-25 12:21:41', '127.0.0.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (30, 3, '2019-12-25 12:45:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (31, 3, '2019-12-30 06:55:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (32, 3, '2019-12-30 13:11:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (33, 3, '2019-12-31 07:23:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (34, 3, '2020-01-09 06:49:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (35, 3, '2020-01-10 05:20:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (36, 3, '2020-03-04 08:25:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (37, 3, '2020-03-05 06:08:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (39, 3, '2020-03-09 11:27:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (40, 3, '2020-03-17 06:23:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (41, 3, '2020-03-18 06:39:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (42, 3, '2020-03-18 13:48:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (43, 3, '2020-03-19 01:38:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (44, 3, '2020-03-27 06:52:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (45, 3, '2020-03-27 12:26:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (46, 3, '2020-04-12 12:29:14', '0:0:0:0:0:0:0:1', NULL, NULL);

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和权限关系表(除角色中定义的权限以外的加减权限)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
INSERT INTO `ums_admin_role_relation` VALUES (13, 3, 1);
INSERT INTO `ums_admin_role_relation` VALUES (15, 3, 2);
INSERT INTO `ums_admin_role_relation` VALUES (16, 3, 4);

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `change_type` int(1) NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成长值变化历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
INSERT INTO `ums_growth_change_history` VALUES (1, 1, '2018-08-29 17:16:35', 0, 1000, 'test', '测试使用', 1);

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `change_type` int(1) NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分变化历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(11) NULL DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int(11) NULL DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int(11) NULL DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int(1) NULL DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分消费设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
INSERT INTO `ums_integration_consume_setting` VALUES (1, 100, 50, 100, 1);

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` int(1) NULL DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` int(1) NULL DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '用户来源',
  `integration` int(11) NULL DEFAULT NULL COMMENT '积分',
  `growth` int(11) NULL DEFAULT NULL COMMENT '成长值',
  `luckey_count` int(11) NULL DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int(11) NULL DEFAULT NULL COMMENT '历史积分数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1012 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, 4, 'test', '$2a$10$zUnskPAYscI1P4qQYICN.OvFU63eELVwqegx/thOqkxN2shB5KDEy', 'windir', '18061581849', 1, '2018-08-02 10:35:44', NULL, 1, '2009-06-01', '上海', '学生', 'test', NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (3, 4, 'windy', '$2a$10$cEQUIgXzz3V95.WipbS8m.6rV1Rprylw.HLg.7.L0s0GlLTbTYzrK', 'windy', '18061581848', 1, '2018-08-03 16:46:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (4, 4, 'zhengsan', '$2a$10$cEQUIgXzz3V95.WipbS8m.6rV1Rprylw.HLg.7.L0s0GlLTbTYzrK', 'zhengsan', '18061581847', 1, '2018-11-12 14:12:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (5, 4, 'lisi', '$2a$10$cEQUIgXzz3V95.WipbS8m.6rV1Rprylw.HLg.7.L0s0GlLTbTYzrK', 'lisi', '18061581841', 1, '2018-11-12 14:12:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (6, 4, 'wangwu', '$2a$10$cEQUIgXzz3V95.WipbS8m.6rV1Rprylw.HLg.7.L0s0GlLTbTYzrK', 'wangwu', '18061581842', 1, '2018-11-12 14:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (7, 4, 'lion', '$2a$10$cEQUIgXzz3V95.WipbS8m.6rV1Rprylw.HLg.7.L0s0GlLTbTYzrK', 'lion', '18061581845', 1, '2018-11-12 14:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (8, 4, 'shari', '$2a$10$cEQUIgXzz3V95.WipbS8m.6rV1Rprylw.HLg.7.L0s0GlLTbTYzrK', 'shari', '18061581844', 1, '2018-11-12 14:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (9, 4, 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (10, 4, 'yg', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'yangguo', '13829022921', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (11, 4, 'xiaolongnv', '$2a$10$t7uC4Cj/V7KPARHJQw8Js.WqV4iiAr.dmEiV4kQNRteu33GK.0gyq', 'xiaolongnv', '18061581859', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (12, 4, 'yangguo1', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo1', '173739601', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (13, 4, 'yangguo2', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo2', '173739602', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (14, 4, 'yangguo3', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo3', '173739603', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (15, 4, 'yangguo4', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo4', '173739604', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (16, 4, 'yangguo5', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo5', '173739605', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (17, 4, 'yangguo6', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo6', '173739606', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (18, 4, 'yangguo7', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo7', '173739607', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (19, 4, 'yangguo8', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo8', '173739608', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (20, 4, 'yangguo9', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo9', '173739609', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (21, 4, 'yangguo10', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo10', '1737396010', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (22, 4, 'yangguo11', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo11', '1737396011', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (23, 4, 'yangguo12', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo12', '1737396012', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (24, 4, 'yangguo13', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo13', '1737396013', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (25, 4, 'yangguo14', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo14', '1737396014', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (26, 4, 'yangguo15', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo15', '1737396015', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (27, 4, 'yangguo16', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo16', '1737396016', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (28, 4, 'yangguo17', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo17', '1737396017', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (29, 4, 'yangguo18', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo18', '1737396018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (30, 4, 'yangguo19', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo19', '1737396019', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (31, 4, 'yangguo20', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo20', '1737396020', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (32, 4, 'yangguo21', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo21', '1737396021', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (33, 4, 'yangguo22', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo22', '1737396022', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (34, 4, 'yangguo23', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo23', '1737396023', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (35, 4, 'yangguo24', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo24', '1737396024', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (36, 4, 'yangguo25', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo25', '1737396025', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (37, 4, 'yangguo26', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo26', '1737396026', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (38, 4, 'yangguo27', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo27', '1737396027', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (39, 4, 'yangguo28', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo28', '1737396028', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (40, 4, 'yangguo29', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo29', '1737396029', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (41, 4, 'yangguo30', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo30', '1737396030', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (42, 4, 'yangguo31', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo31', '1737396031', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (43, 4, 'yangguo32', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo32', '1737396032', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (44, 4, 'yangguo33', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo33', '1737396033', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (45, 4, 'yangguo34', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo34', '1737396034', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (46, 4, 'yangguo35', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo35', '1737396035', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (47, 4, 'yangguo36', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo36', '1737396036', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (48, 4, 'yangguo37', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo37', '1737396037', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (49, 4, 'yangguo38', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo38', '1737396038', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (50, 4, 'yangguo39', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo39', '1737396039', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (51, 4, 'yangguo40', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo40', '1737396040', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (52, 4, 'yangguo41', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo41', '1737396041', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (53, 4, 'yangguo42', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo42', '1737396042', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (54, 4, 'yangguo43', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo43', '1737396043', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (55, 4, 'yangguo44', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo44', '1737396044', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (56, 4, 'yangguo45', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo45', '1737396045', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (57, 4, 'yangguo46', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo46', '1737396046', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (58, 4, 'yangguo47', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo47', '1737396047', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (59, 4, 'yangguo48', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo48', '1737396048', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (60, 4, 'yangguo49', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo49', '1737396049', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (61, 4, 'yangguo50', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo50', '1737396050', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (62, 4, 'yangguo51', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo51', '1737396051', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (63, 4, 'yangguo52', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo52', '1737396052', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (64, 4, 'yangguo53', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo53', '1737396053', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (65, 4, 'yangguo54', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo54', '1737396054', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (66, 4, 'yangguo55', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo55', '1737396055', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (67, 4, 'yangguo56', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo56', '1737396056', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (68, 4, 'yangguo57', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo57', '1737396057', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (69, 4, 'yangguo58', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo58', '1737396058', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (70, 4, 'yangguo59', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo59', '1737396059', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (71, 4, 'yangguo60', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo60', '1737396060', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (72, 4, 'yangguo61', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo61', '1737396061', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (73, 4, 'yangguo62', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo62', '1737396062', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (74, 4, 'yangguo63', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo63', '1737396063', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (75, 4, 'yangguo64', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo64', '1737396064', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (76, 4, 'yangguo65', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo65', '1737396065', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (77, 4, 'yangguo66', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo66', '1737396066', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (78, 4, 'yangguo67', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo67', '1737396067', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (79, 4, 'yangguo68', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo68', '1737396068', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (80, 4, 'yangguo69', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo69', '1737396069', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (81, 4, 'yangguo70', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo70', '1737396070', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (82, 4, 'yangguo71', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo71', '1737396071', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (83, 4, 'yangguo72', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo72', '1737396072', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (84, 4, 'yangguo73', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo73', '1737396073', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (85, 4, 'yangguo74', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo74', '1737396074', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (86, 4, 'yangguo75', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo75', '1737396075', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (87, 4, 'yangguo76', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo76', '1737396076', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (88, 4, 'yangguo77', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo77', '1737396077', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (89, 4, 'yangguo78', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo78', '1737396078', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (90, 4, 'yangguo79', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo79', '1737396079', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (91, 4, 'yangguo80', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo80', '1737396080', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (92, 4, 'yangguo81', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo81', '1737396081', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (93, 4, 'yangguo82', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo82', '1737396082', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (94, 4, 'yangguo83', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo83', '1737396083', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (95, 4, 'yangguo84', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo84', '1737396084', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (96, 4, 'yangguo85', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo85', '1737396085', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (97, 4, 'yangguo86', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo86', '1737396086', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (98, 4, 'yangguo87', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo87', '1737396087', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (99, 4, 'yangguo88', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo88', '1737396088', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (100, 4, 'yangguo89', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo89', '1737396089', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (101, 4, 'yangguo90', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo90', '1737396090', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (102, 4, 'yangguo91', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo91', '1737396091', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (103, 4, 'yangguo92', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo92', '1737396092', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (104, 4, 'yangguo93', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo93', '1737396093', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (105, 4, 'yangguo94', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo94', '1737396094', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (106, 4, 'yangguo95', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo95', '1737396095', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (107, 4, 'yangguo96', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo96', '1737396096', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (108, 4, 'yangguo97', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo97', '1737396097', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (109, 4, 'yangguo98', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo98', '1737396098', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (110, 4, 'yangguo99', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo99', '1737396099', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (111, 4, 'yangguo100', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo100', '17373960100', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (112, 4, 'yangguo101', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo101', '17373960101', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (113, 4, 'yangguo102', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo102', '17373960102', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (114, 4, 'yangguo103', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo103', '17373960103', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (115, 4, 'yangguo104', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo104', '17373960104', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (116, 4, 'yangguo105', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo105', '17373960105', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (117, 4, 'yangguo106', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo106', '17373960106', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (118, 4, 'yangguo107', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo107', '17373960107', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (119, 4, 'yangguo108', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo108', '17373960108', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (120, 4, 'yangguo109', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo109', '17373960109', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (121, 4, 'yangguo110', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo110', '17373960110', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (122, 4, 'yangguo111', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo111', '17373960111', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (123, 4, 'yangguo112', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo112', '17373960112', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (124, 4, 'yangguo113', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo113', '17373960113', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (125, 4, 'yangguo114', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo114', '17373960114', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (126, 4, 'yangguo115', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo115', '17373960115', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (127, 4, 'yangguo116', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo116', '17373960116', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (128, 4, 'yangguo117', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo117', '17373960117', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (129, 4, 'yangguo118', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo118', '17373960118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (130, 4, 'yangguo119', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo119', '17373960119', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (131, 4, 'yangguo120', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo120', '17373960120', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (132, 4, 'yangguo121', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo121', '17373960121', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (133, 4, 'yangguo122', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo122', '17373960122', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (134, 4, 'yangguo123', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo123', '17373960123', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (135, 4, 'yangguo124', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo124', '17373960124', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (136, 4, 'yangguo125', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo125', '17373960125', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (137, 4, 'yangguo126', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo126', '17373960126', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (138, 4, 'yangguo127', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo127', '17373960127', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (139, 4, 'yangguo128', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo128', '17373960128', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (140, 4, 'yangguo129', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo129', '17373960129', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (141, 4, 'yangguo130', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo130', '17373960130', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (142, 4, 'yangguo131', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo131', '17373960131', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (143, 4, 'yangguo132', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo132', '17373960132', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (144, 4, 'yangguo133', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo133', '17373960133', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (145, 4, 'yangguo134', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo134', '17373960134', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (146, 4, 'yangguo135', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo135', '17373960135', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (147, 4, 'yangguo136', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo136', '17373960136', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (148, 4, 'yangguo137', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo137', '17373960137', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (149, 4, 'yangguo138', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo138', '17373960138', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (150, 4, 'yangguo139', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo139', '17373960139', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (151, 4, 'yangguo140', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo140', '17373960140', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (152, 4, 'yangguo141', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo141', '17373960141', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (153, 4, 'yangguo142', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo142', '17373960142', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (154, 4, 'yangguo143', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo143', '17373960143', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (155, 4, 'yangguo144', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo144', '17373960144', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (156, 4, 'yangguo145', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo145', '17373960145', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (157, 4, 'yangguo146', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo146', '17373960146', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (158, 4, 'yangguo147', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo147', '17373960147', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (159, 4, 'yangguo148', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo148', '17373960148', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (160, 4, 'yangguo149', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo149', '17373960149', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (161, 4, 'yangguo150', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo150', '17373960150', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (162, 4, 'yangguo151', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo151', '17373960151', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (163, 4, 'yangguo152', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo152', '17373960152', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (164, 4, 'yangguo153', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo153', '17373960153', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (165, 4, 'yangguo154', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo154', '17373960154', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (166, 4, 'yangguo155', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo155', '17373960155', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (167, 4, 'yangguo156', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo156', '17373960156', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (168, 4, 'yangguo157', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo157', '17373960157', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (169, 4, 'yangguo158', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo158', '17373960158', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (170, 4, 'yangguo159', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo159', '17373960159', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (171, 4, 'yangguo160', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo160', '17373960160', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (172, 4, 'yangguo161', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo161', '17373960161', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (173, 4, 'yangguo162', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo162', '17373960162', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (174, 4, 'yangguo163', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo163', '17373960163', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (175, 4, 'yangguo164', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo164', '17373960164', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (176, 4, 'yangguo165', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo165', '17373960165', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (177, 4, 'yangguo166', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo166', '17373960166', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (178, 4, 'yangguo167', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo167', '17373960167', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (179, 4, 'yangguo168', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo168', '17373960168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (180, 4, 'yangguo169', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo169', '17373960169', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (181, 4, 'yangguo170', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo170', '17373960170', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (182, 4, 'yangguo171', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo171', '17373960171', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (183, 4, 'yangguo172', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo172', '17373960172', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (184, 4, 'yangguo173', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo173', '17373960173', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (185, 4, 'yangguo174', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo174', '17373960174', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (186, 4, 'yangguo175', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo175', '17373960175', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (187, 4, 'yangguo176', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo176', '17373960176', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (188, 4, 'yangguo177', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo177', '17373960177', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (189, 4, 'yangguo178', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo178', '17373960178', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (190, 4, 'yangguo179', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo179', '17373960179', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (191, 4, 'yangguo180', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo180', '17373960180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (192, 4, 'yangguo181', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo181', '17373960181', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (193, 4, 'yangguo182', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo182', '17373960182', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (194, 4, 'yangguo183', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo183', '17373960183', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (195, 4, 'yangguo184', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo184', '17373960184', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (196, 4, 'yangguo185', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo185', '17373960185', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (197, 4, 'yangguo186', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo186', '17373960186', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (198, 4, 'yangguo187', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo187', '17373960187', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (199, 4, 'yangguo188', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo188', '17373960188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (200, 4, 'yangguo189', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo189', '17373960189', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (201, 4, 'yangguo190', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo190', '17373960190', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (202, 4, 'yangguo191', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo191', '17373960191', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (203, 4, 'yangguo192', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo192', '17373960192', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (204, 4, 'yangguo193', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo193', '17373960193', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (205, 4, 'yangguo194', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo194', '17373960194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (206, 4, 'yangguo195', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo195', '17373960195', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (207, 4, 'yangguo196', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo196', '17373960196', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (208, 4, 'yangguo197', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo197', '17373960197', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (209, 4, 'yangguo198', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo198', '17373960198', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (210, 4, 'yangguo199', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo199', '17373960199', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (211, 4, 'yangguo200', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo200', '17373960200', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (212, 4, 'yangguo201', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo201', '17373960201', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (213, 4, 'yangguo202', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo202', '17373960202', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (214, 4, 'yangguo203', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo203', '17373960203', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (215, 4, 'yangguo204', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo204', '17373960204', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (216, 4, 'yangguo205', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo205', '17373960205', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (217, 4, 'yangguo206', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo206', '17373960206', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (218, 4, 'yangguo207', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo207', '17373960207', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (219, 4, 'yangguo208', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo208', '17373960208', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (220, 4, 'yangguo209', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo209', '17373960209', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (221, 4, 'yangguo210', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo210', '17373960210', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (222, 4, 'yangguo211', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo211', '17373960211', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (223, 4, 'yangguo212', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo212', '17373960212', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (224, 4, 'yangguo213', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo213', '17373960213', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (225, 4, 'yangguo214', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo214', '17373960214', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (226, 4, 'yangguo215', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo215', '17373960215', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (227, 4, 'yangguo216', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo216', '17373960216', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (228, 4, 'yangguo217', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo217', '17373960217', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (229, 4, 'yangguo218', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo218', '17373960218', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (230, 4, 'yangguo219', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo219', '17373960219', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (231, 4, 'yangguo220', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo220', '17373960220', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (232, 4, 'yangguo221', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo221', '17373960221', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (233, 4, 'yangguo222', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo222', '17373960222', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (234, 4, 'yangguo223', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo223', '17373960223', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (235, 4, 'yangguo224', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo224', '17373960224', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (236, 4, 'yangguo225', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo225', '17373960225', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (237, 4, 'yangguo226', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo226', '17373960226', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (238, 4, 'yangguo227', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo227', '17373960227', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (239, 4, 'yangguo228', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo228', '17373960228', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (240, 4, 'yangguo229', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo229', '17373960229', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (241, 4, 'yangguo230', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo230', '17373960230', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (242, 4, 'yangguo231', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo231', '17373960231', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (243, 4, 'yangguo232', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo232', '17373960232', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (244, 4, 'yangguo233', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo233', '17373960233', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (245, 4, 'yangguo234', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo234', '17373960234', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (246, 4, 'yangguo235', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo235', '17373960235', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (247, 4, 'yangguo236', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo236', '17373960236', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (248, 4, 'yangguo237', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo237', '17373960237', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (249, 4, 'yangguo238', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo238', '17373960238', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (250, 4, 'yangguo239', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo239', '17373960239', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (251, 4, 'yangguo240', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo240', '17373960240', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (252, 4, 'yangguo241', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo241', '17373960241', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (253, 4, 'yangguo242', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo242', '17373960242', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (254, 4, 'yangguo243', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo243', '17373960243', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (255, 4, 'yangguo244', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo244', '17373960244', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (256, 4, 'yangguo245', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo245', '17373960245', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (257, 4, 'yangguo246', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo246', '17373960246', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (258, 4, 'yangguo247', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo247', '17373960247', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (259, 4, 'yangguo248', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo248', '17373960248', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (260, 4, 'yangguo249', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo249', '17373960249', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (261, 4, 'yangguo250', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo250', '17373960250', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (262, 4, 'yangguo251', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo251', '17373960251', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (263, 4, 'yangguo252', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo252', '17373960252', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (264, 4, 'yangguo253', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo253', '17373960253', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (265, 4, 'yangguo254', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo254', '17373960254', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (266, 4, 'yangguo255', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo255', '17373960255', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (267, 4, 'yangguo256', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo256', '17373960256', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (268, 4, 'yangguo257', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo257', '17373960257', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (269, 4, 'yangguo258', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo258', '17373960258', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (270, 4, 'yangguo259', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo259', '17373960259', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (271, 4, 'yangguo260', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo260', '17373960260', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (272, 4, 'yangguo261', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo261', '17373960261', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (273, 4, 'yangguo262', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo262', '17373960262', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (274, 4, 'yangguo263', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo263', '17373960263', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (275, 4, 'yangguo264', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo264', '17373960264', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (276, 4, 'yangguo265', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo265', '17373960265', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (277, 4, 'yangguo266', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo266', '17373960266', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (278, 4, 'yangguo267', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo267', '17373960267', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (279, 4, 'yangguo268', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo268', '17373960268', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (280, 4, 'yangguo269', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo269', '17373960269', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (281, 4, 'yangguo270', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo270', '17373960270', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (282, 4, 'yangguo271', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo271', '17373960271', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (283, 4, 'yangguo272', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo272', '17373960272', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (284, 4, 'yangguo273', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo273', '17373960273', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (285, 4, 'yangguo274', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo274', '17373960274', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (286, 4, 'yangguo275', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo275', '17373960275', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (287, 4, 'yangguo276', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo276', '17373960276', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (288, 4, 'yangguo277', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo277', '17373960277', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (289, 4, 'yangguo278', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo278', '17373960278', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (290, 4, 'yangguo279', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo279', '17373960279', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (291, 4, 'yangguo280', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo280', '17373960280', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (292, 4, 'yangguo281', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo281', '17373960281', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (293, 4, 'yangguo282', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo282', '17373960282', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (294, 4, 'yangguo283', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo283', '17373960283', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (295, 4, 'yangguo284', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo284', '17373960284', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (296, 4, 'yangguo285', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo285', '17373960285', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (297, 4, 'yangguo286', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo286', '17373960286', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (298, 4, 'yangguo287', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo287', '17373960287', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (299, 4, 'yangguo288', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo288', '17373960288', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (300, 4, 'yangguo289', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo289', '17373960289', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (301, 4, 'yangguo290', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo290', '17373960290', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (302, 4, 'yangguo291', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo291', '17373960291', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (303, 4, 'yangguo292', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo292', '17373960292', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (304, 4, 'yangguo293', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo293', '17373960293', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (305, 4, 'yangguo294', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo294', '17373960294', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (306, 4, 'yangguo295', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo295', '17373960295', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (307, 4, 'yangguo296', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo296', '17373960296', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (308, 4, 'yangguo297', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo297', '17373960297', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (309, 4, 'yangguo298', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo298', '17373960298', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (310, 4, 'yangguo299', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo299', '17373960299', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (311, 4, 'yangguo300', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo300', '17373960300', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (312, 4, 'yangguo301', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo301', '17373960301', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (313, 4, 'yangguo302', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo302', '17373960302', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (314, 4, 'yangguo303', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo303', '17373960303', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (315, 4, 'yangguo304', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo304', '17373960304', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (316, 4, 'yangguo305', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo305', '17373960305', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (317, 4, 'yangguo306', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo306', '17373960306', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (318, 4, 'yangguo307', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo307', '17373960307', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (319, 4, 'yangguo308', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo308', '17373960308', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (320, 4, 'yangguo309', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo309', '17373960309', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (321, 4, 'yangguo310', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo310', '17373960310', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (322, 4, 'yangguo311', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo311', '17373960311', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (323, 4, 'yangguo312', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo312', '17373960312', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (324, 4, 'yangguo313', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo313', '17373960313', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (325, 4, 'yangguo314', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo314', '17373960314', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (326, 4, 'yangguo315', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo315', '17373960315', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (327, 4, 'yangguo316', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo316', '17373960316', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (328, 4, 'yangguo317', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo317', '17373960317', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (329, 4, 'yangguo318', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo318', '17373960318', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (330, 4, 'yangguo319', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo319', '17373960319', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (331, 4, 'yangguo320', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo320', '17373960320', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (332, 4, 'yangguo321', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo321', '17373960321', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (333, 4, 'yangguo322', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo322', '17373960322', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (334, 4, 'yangguo323', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo323', '17373960323', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (335, 4, 'yangguo324', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo324', '17373960324', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (336, 4, 'yangguo325', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo325', '17373960325', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (337, 4, 'yangguo326', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo326', '17373960326', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (338, 4, 'yangguo327', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo327', '17373960327', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (339, 4, 'yangguo328', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo328', '17373960328', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (340, 4, 'yangguo329', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo329', '17373960329', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (341, 4, 'yangguo330', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo330', '17373960330', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (342, 4, 'yangguo331', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo331', '17373960331', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (343, 4, 'yangguo332', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo332', '17373960332', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (344, 4, 'yangguo333', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo333', '17373960333', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (345, 4, 'yangguo334', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo334', '17373960334', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (346, 4, 'yangguo335', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo335', '17373960335', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (347, 4, 'yangguo336', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo336', '17373960336', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (348, 4, 'yangguo337', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo337', '17373960337', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (349, 4, 'yangguo338', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo338', '17373960338', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (350, 4, 'yangguo339', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo339', '17373960339', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (351, 4, 'yangguo340', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo340', '17373960340', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (352, 4, 'yangguo341', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo341', '17373960341', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (353, 4, 'yangguo342', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo342', '17373960342', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (354, 4, 'yangguo343', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo343', '17373960343', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (355, 4, 'yangguo344', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo344', '17373960344', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (356, 4, 'yangguo345', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo345', '17373960345', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (357, 4, 'yangguo346', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo346', '17373960346', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (358, 4, 'yangguo347', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo347', '17373960347', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (359, 4, 'yangguo348', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo348', '17373960348', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (360, 4, 'yangguo349', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo349', '17373960349', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (361, 4, 'yangguo350', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo350', '17373960350', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (362, 4, 'yangguo351', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo351', '17373960351', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (363, 4, 'yangguo352', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo352', '17373960352', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (364, 4, 'yangguo353', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo353', '17373960353', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (365, 4, 'yangguo354', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo354', '17373960354', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (366, 4, 'yangguo355', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo355', '17373960355', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (367, 4, 'yangguo356', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo356', '17373960356', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (368, 4, 'yangguo357', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo357', '17373960357', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (369, 4, 'yangguo358', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo358', '17373960358', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (370, 4, 'yangguo359', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo359', '17373960359', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (371, 4, 'yangguo360', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo360', '17373960360', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (372, 4, 'yangguo361', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo361', '17373960361', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (373, 4, 'yangguo362', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo362', '17373960362', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (374, 4, 'yangguo363', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo363', '17373960363', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (375, 4, 'yangguo364', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo364', '17373960364', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (376, 4, 'yangguo365', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo365', '17373960365', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (377, 4, 'yangguo366', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo366', '17373960366', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (378, 4, 'yangguo367', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo367', '17373960367', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (379, 4, 'yangguo368', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo368', '17373960368', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (380, 4, 'yangguo369', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo369', '17373960369', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (381, 4, 'yangguo370', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo370', '17373960370', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (382, 4, 'yangguo371', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo371', '17373960371', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (383, 4, 'yangguo372', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo372', '17373960372', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (384, 4, 'yangguo373', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo373', '17373960373', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (385, 4, 'yangguo374', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo374', '17373960374', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (386, 4, 'yangguo375', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo375', '17373960375', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (387, 4, 'yangguo376', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo376', '17373960376', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (388, 4, 'yangguo377', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo377', '17373960377', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (389, 4, 'yangguo378', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo378', '17373960378', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (390, 4, 'yangguo379', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo379', '17373960379', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (391, 4, 'yangguo380', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo380', '17373960380', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (392, 4, 'yangguo381', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo381', '17373960381', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (393, 4, 'yangguo382', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo382', '17373960382', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (394, 4, 'yangguo383', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo383', '17373960383', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (395, 4, 'yangguo384', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo384', '17373960384', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (396, 4, 'yangguo385', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo385', '17373960385', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (397, 4, 'yangguo386', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo386', '17373960386', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (398, 4, 'yangguo387', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo387', '17373960387', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (399, 4, 'yangguo388', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo388', '17373960388', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (400, 4, 'yangguo389', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo389', '17373960389', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (401, 4, 'yangguo390', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo390', '17373960390', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (402, 4, 'yangguo391', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo391', '17373960391', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (403, 4, 'yangguo392', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo392', '17373960392', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (404, 4, 'yangguo393', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo393', '17373960393', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (405, 4, 'yangguo394', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo394', '17373960394', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (406, 4, 'yangguo395', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo395', '17373960395', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (407, 4, 'yangguo396', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo396', '17373960396', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (408, 4, 'yangguo397', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo397', '17373960397', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (409, 4, 'yangguo398', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo398', '17373960398', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (410, 4, 'yangguo399', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo399', '17373960399', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (411, 4, 'yangguo400', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo400', '17373960400', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (412, 4, 'yangguo401', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo401', '17373960401', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (413, 4, 'yangguo402', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo402', '17373960402', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (414, 4, 'yangguo403', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo403', '17373960403', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (415, 4, 'yangguo404', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo404', '17373960404', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (416, 4, 'yangguo405', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo405', '17373960405', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (417, 4, 'yangguo406', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo406', '17373960406', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (418, 4, 'yangguo407', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo407', '17373960407', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (419, 4, 'yangguo408', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo408', '17373960408', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (420, 4, 'yangguo409', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo409', '17373960409', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (421, 4, 'yangguo410', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo410', '17373960410', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (422, 4, 'yangguo411', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo411', '17373960411', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (423, 4, 'yangguo412', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo412', '17373960412', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (424, 4, 'yangguo413', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo413', '17373960413', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (425, 4, 'yangguo414', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo414', '17373960414', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (426, 4, 'yangguo415', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo415', '17373960415', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (427, 4, 'yangguo416', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo416', '17373960416', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (428, 4, 'yangguo417', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo417', '17373960417', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (429, 4, 'yangguo418', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo418', '17373960418', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (430, 4, 'yangguo419', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo419', '17373960419', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (431, 4, 'yangguo420', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo420', '17373960420', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (432, 4, 'yangguo421', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo421', '17373960421', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (433, 4, 'yangguo422', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo422', '17373960422', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (434, 4, 'yangguo423', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo423', '17373960423', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (435, 4, 'yangguo424', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo424', '17373960424', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (436, 4, 'yangguo425', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo425', '17373960425', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (437, 4, 'yangguo426', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo426', '17373960426', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (438, 4, 'yangguo427', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo427', '17373960427', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (439, 4, 'yangguo428', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo428', '17373960428', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (440, 4, 'yangguo429', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo429', '17373960429', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (441, 4, 'yangguo430', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo430', '17373960430', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (442, 4, 'yangguo431', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo431', '17373960431', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (443, 4, 'yangguo432', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo432', '17373960432', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (444, 4, 'yangguo433', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo433', '17373960433', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (445, 4, 'yangguo434', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo434', '17373960434', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (446, 4, 'yangguo435', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo435', '17373960435', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (447, 4, 'yangguo436', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo436', '17373960436', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (448, 4, 'yangguo437', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo437', '17373960437', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (449, 4, 'yangguo438', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo438', '17373960438', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (450, 4, 'yangguo439', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo439', '17373960439', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (451, 4, 'yangguo440', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo440', '17373960440', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (452, 4, 'yangguo441', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo441', '17373960441', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (453, 4, 'yangguo442', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo442', '17373960442', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (454, 4, 'yangguo443', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo443', '17373960443', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (455, 4, 'yangguo444', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo444', '17373960444', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (456, 4, 'yangguo445', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo445', '17373960445', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (457, 4, 'yangguo446', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo446', '17373960446', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (458, 4, 'yangguo447', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo447', '17373960447', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (459, 4, 'yangguo448', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo448', '17373960448', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (460, 4, 'yangguo449', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo449', '17373960449', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (461, 4, 'yangguo450', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo450', '17373960450', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (462, 4, 'yangguo451', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo451', '17373960451', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (463, 4, 'yangguo452', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo452', '17373960452', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (464, 4, 'yangguo453', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo453', '17373960453', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (465, 4, 'yangguo454', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo454', '17373960454', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (466, 4, 'yangguo455', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo455', '17373960455', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (467, 4, 'yangguo456', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo456', '17373960456', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (468, 4, 'yangguo457', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo457', '17373960457', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (469, 4, 'yangguo458', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo458', '17373960458', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (470, 4, 'yangguo459', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo459', '17373960459', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (471, 4, 'yangguo460', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo460', '17373960460', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (472, 4, 'yangguo461', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo461', '17373960461', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (473, 4, 'yangguo462', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo462', '17373960462', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (474, 4, 'yangguo463', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo463', '17373960463', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (475, 4, 'yangguo464', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo464', '17373960464', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (476, 4, 'yangguo465', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo465', '17373960465', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (477, 4, 'yangguo466', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo466', '17373960466', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (478, 4, 'yangguo467', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo467', '17373960467', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (479, 4, 'yangguo468', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo468', '17373960468', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (480, 4, 'yangguo469', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo469', '17373960469', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (481, 4, 'yangguo470', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo470', '17373960470', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (482, 4, 'yangguo471', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo471', '17373960471', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (483, 4, 'yangguo472', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo472', '17373960472', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (484, 4, 'yangguo473', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo473', '17373960473', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (485, 4, 'yangguo474', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo474', '17373960474', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (486, 4, 'yangguo475', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo475', '17373960475', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (487, 4, 'yangguo476', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo476', '17373960476', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (488, 4, 'yangguo477', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo477', '17373960477', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (489, 4, 'yangguo478', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo478', '17373960478', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (490, 4, 'yangguo479', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo479', '17373960479', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (491, 4, 'yangguo480', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo480', '17373960480', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (492, 4, 'yangguo481', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo481', '17373960481', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (493, 4, 'yangguo482', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo482', '17373960482', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (494, 4, 'yangguo483', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo483', '17373960483', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (495, 4, 'yangguo484', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo484', '17373960484', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (496, 4, 'yangguo485', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo485', '17373960485', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (497, 4, 'yangguo486', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo486', '17373960486', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (498, 4, 'yangguo487', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo487', '17373960487', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (499, 4, 'yangguo488', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo488', '17373960488', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (500, 4, 'yangguo489', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo489', '17373960489', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (501, 4, 'yangguo490', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo490', '17373960490', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (502, 4, 'yangguo491', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo491', '17373960491', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (503, 4, 'yangguo492', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo492', '17373960492', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (504, 4, 'yangguo493', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo493', '17373960493', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (505, 4, 'yangguo494', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo494', '17373960494', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (506, 4, 'yangguo495', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo495', '17373960495', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (507, 4, 'yangguo496', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo496', '17373960496', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (508, 4, 'yangguo497', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo497', '17373960497', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (509, 4, 'yangguo498', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo498', '17373960498', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (510, 4, 'yangguo499', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo499', '17373960499', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (511, 4, 'yangguo500', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo500', '17373960500', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (512, 4, 'yangguo501', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo501', '17373960501', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (513, 4, 'yangguo502', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo502', '17373960502', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (514, 4, 'yangguo503', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo503', '17373960503', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (515, 4, 'yangguo504', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo504', '17373960504', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (516, 4, 'yangguo505', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo505', '17373960505', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (517, 4, 'yangguo506', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo506', '17373960506', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (518, 4, 'yangguo507', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo507', '17373960507', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (519, 4, 'yangguo508', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo508', '17373960508', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (520, 4, 'yangguo509', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo509', '17373960509', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (521, 4, 'yangguo510', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo510', '17373960510', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (522, 4, 'yangguo511', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo511', '17373960511', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (523, 4, 'yangguo512', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo512', '17373960512', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (524, 4, 'yangguo513', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo513', '17373960513', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (525, 4, 'yangguo514', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo514', '17373960514', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (526, 4, 'yangguo515', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo515', '17373960515', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (527, 4, 'yangguo516', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo516', '17373960516', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (528, 4, 'yangguo517', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo517', '17373960517', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (529, 4, 'yangguo518', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo518', '17373960518', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (530, 4, 'yangguo519', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo519', '17373960519', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (531, 4, 'yangguo520', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo520', '17373960520', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (532, 4, 'yangguo521', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo521', '17373960521', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (533, 4, 'yangguo522', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo522', '17373960522', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (534, 4, 'yangguo523', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo523', '17373960523', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (535, 4, 'yangguo524', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo524', '17373960524', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (536, 4, 'yangguo525', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo525', '17373960525', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (537, 4, 'yangguo526', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo526', '17373960526', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (538, 4, 'yangguo527', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo527', '17373960527', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (539, 4, 'yangguo528', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo528', '17373960528', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (540, 4, 'yangguo529', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo529', '17373960529', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (541, 4, 'yangguo530', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo530', '17373960530', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (542, 4, 'yangguo531', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo531', '17373960531', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (543, 4, 'yangguo532', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo532', '17373960532', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (544, 4, 'yangguo533', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo533', '17373960533', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (545, 4, 'yangguo534', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo534', '17373960534', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (546, 4, 'yangguo535', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo535', '17373960535', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (547, 4, 'yangguo536', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo536', '17373960536', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (548, 4, 'yangguo537', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo537', '17373960537', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (549, 4, 'yangguo538', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo538', '17373960538', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (550, 4, 'yangguo539', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo539', '17373960539', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (551, 4, 'yangguo540', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo540', '17373960540', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (552, 4, 'yangguo541', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo541', '17373960541', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (553, 4, 'yangguo542', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo542', '17373960542', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (554, 4, 'yangguo543', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo543', '17373960543', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (555, 4, 'yangguo544', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo544', '17373960544', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (556, 4, 'yangguo545', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo545', '17373960545', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (557, 4, 'yangguo546', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo546', '17373960546', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (558, 4, 'yangguo547', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo547', '17373960547', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (559, 4, 'yangguo548', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo548', '17373960548', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (560, 4, 'yangguo549', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo549', '17373960549', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (561, 4, 'yangguo550', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo550', '17373960550', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (562, 4, 'yangguo551', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo551', '17373960551', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (563, 4, 'yangguo552', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo552', '17373960552', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (564, 4, 'yangguo553', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo553', '17373960553', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (565, 4, 'yangguo554', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo554', '17373960554', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (566, 4, 'yangguo555', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo555', '17373960555', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (567, 4, 'yangguo556', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo556', '17373960556', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (568, 4, 'yangguo557', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo557', '17373960557', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (569, 4, 'yangguo558', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo558', '17373960558', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (570, 4, 'yangguo559', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo559', '17373960559', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (571, 4, 'yangguo560', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo560', '17373960560', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (572, 4, 'yangguo561', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo561', '17373960561', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (573, 4, 'yangguo562', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo562', '17373960562', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (574, 4, 'yangguo563', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo563', '17373960563', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (575, 4, 'yangguo564', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo564', '17373960564', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (576, 4, 'yangguo565', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo565', '17373960565', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (577, 4, 'yangguo566', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo566', '17373960566', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (578, 4, 'yangguo567', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo567', '17373960567', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (579, 4, 'yangguo568', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo568', '17373960568', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (580, 4, 'yangguo569', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo569', '17373960569', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (581, 4, 'yangguo570', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo570', '17373960570', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (582, 4, 'yangguo571', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo571', '17373960571', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (583, 4, 'yangguo572', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo572', '17373960572', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (584, 4, 'yangguo573', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo573', '17373960573', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (585, 4, 'yangguo574', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo574', '17373960574', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (586, 4, 'yangguo575', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo575', '17373960575', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (587, 4, 'yangguo576', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo576', '17373960576', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (588, 4, 'yangguo577', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo577', '17373960577', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (589, 4, 'yangguo578', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo578', '17373960578', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (590, 4, 'yangguo579', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo579', '17373960579', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (591, 4, 'yangguo580', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo580', '17373960580', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (592, 4, 'yangguo581', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo581', '17373960581', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (593, 4, 'yangguo582', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo582', '17373960582', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (594, 4, 'yangguo583', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo583', '17373960583', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (595, 4, 'yangguo584', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo584', '17373960584', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (596, 4, 'yangguo585', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo585', '17373960585', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (597, 4, 'yangguo586', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo586', '17373960586', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (598, 4, 'yangguo587', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo587', '17373960587', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (599, 4, 'yangguo588', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo588', '17373960588', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (600, 4, 'yangguo589', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo589', '17373960589', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (601, 4, 'yangguo590', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo590', '17373960590', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (602, 4, 'yangguo591', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo591', '17373960591', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (603, 4, 'yangguo592', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo592', '17373960592', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (604, 4, 'yangguo593', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo593', '17373960593', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (605, 4, 'yangguo594', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo594', '17373960594', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (606, 4, 'yangguo595', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo595', '17373960595', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (607, 4, 'yangguo596', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo596', '17373960596', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (608, 4, 'yangguo597', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo597', '17373960597', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (609, 4, 'yangguo598', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo598', '17373960598', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (610, 4, 'yangguo599', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo599', '17373960599', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (611, 4, 'yangguo600', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo600', '17373960600', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (612, 4, 'yangguo601', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo601', '17373960601', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (613, 4, 'yangguo602', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo602', '17373960602', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (614, 4, 'yangguo603', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo603', '17373960603', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (615, 4, 'yangguo604', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo604', '17373960604', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (616, 4, 'yangguo605', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo605', '17373960605', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (617, 4, 'yangguo606', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo606', '17373960606', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (618, 4, 'yangguo607', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo607', '17373960607', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (619, 4, 'yangguo608', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo608', '17373960608', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (620, 4, 'yangguo609', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo609', '17373960609', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (621, 4, 'yangguo610', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo610', '17373960610', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (622, 4, 'yangguo611', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo611', '17373960611', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (623, 4, 'yangguo612', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo612', '17373960612', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (624, 4, 'yangguo613', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo613', '17373960613', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (625, 4, 'yangguo614', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo614', '17373960614', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (626, 4, 'yangguo615', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo615', '17373960615', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (627, 4, 'yangguo616', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo616', '17373960616', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (628, 4, 'yangguo617', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo617', '17373960617', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (629, 4, 'yangguo618', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo618', '17373960618', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (630, 4, 'yangguo619', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo619', '17373960619', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (631, 4, 'yangguo620', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo620', '17373960620', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (632, 4, 'yangguo621', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo621', '17373960621', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (633, 4, 'yangguo622', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo622', '17373960622', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (634, 4, 'yangguo623', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo623', '17373960623', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (635, 4, 'yangguo624', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo624', '17373960624', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (636, 4, 'yangguo625', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo625', '17373960625', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (637, 4, 'yangguo626', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo626', '17373960626', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (638, 4, 'yangguo627', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo627', '17373960627', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (639, 4, 'yangguo628', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo628', '17373960628', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (640, 4, 'yangguo629', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo629', '17373960629', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (641, 4, 'yangguo630', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo630', '17373960630', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (642, 4, 'yangguo631', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo631', '17373960631', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (643, 4, 'yangguo632', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo632', '17373960632', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (644, 4, 'yangguo633', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo633', '17373960633', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (645, 4, 'yangguo634', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo634', '17373960634', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (646, 4, 'yangguo635', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo635', '17373960635', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (647, 4, 'yangguo636', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo636', '17373960636', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (648, 4, 'yangguo637', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo637', '17373960637', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (649, 4, 'yangguo638', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo638', '17373960638', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (650, 4, 'yangguo639', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo639', '17373960639', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (651, 4, 'yangguo640', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo640', '17373960640', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (652, 4, 'yangguo641', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo641', '17373960641', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (653, 4, 'yangguo642', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo642', '17373960642', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (654, 4, 'yangguo643', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo643', '17373960643', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (655, 4, 'yangguo644', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo644', '17373960644', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (656, 4, 'yangguo645', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo645', '17373960645', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (657, 4, 'yangguo646', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo646', '17373960646', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (658, 4, 'yangguo647', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo647', '17373960647', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (659, 4, 'yangguo648', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo648', '17373960648', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (660, 4, 'yangguo649', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo649', '17373960649', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (661, 4, 'yangguo650', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo650', '17373960650', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (662, 4, 'yangguo651', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo651', '17373960651', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (663, 4, 'yangguo652', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo652', '17373960652', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (664, 4, 'yangguo653', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo653', '17373960653', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (665, 4, 'yangguo654', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo654', '17373960654', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (666, 4, 'yangguo655', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo655', '17373960655', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (667, 4, 'yangguo656', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo656', '17373960656', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (668, 4, 'yangguo657', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo657', '17373960657', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (669, 4, 'yangguo658', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo658', '17373960658', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (670, 4, 'yangguo659', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo659', '17373960659', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (671, 4, 'yangguo660', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo660', '17373960660', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (672, 4, 'yangguo661', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo661', '17373960661', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (673, 4, 'yangguo662', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo662', '17373960662', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (674, 4, 'yangguo663', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo663', '17373960663', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (675, 4, 'yangguo664', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo664', '17373960664', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (676, 4, 'yangguo665', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo665', '17373960665', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (677, 4, 'yangguo666', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo666', '17373960666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (678, 4, 'yangguo667', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo667', '17373960667', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (679, 4, 'yangguo668', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo668', '17373960668', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (680, 4, 'yangguo669', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo669', '17373960669', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (681, 4, 'yangguo670', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo670', '17373960670', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (682, 4, 'yangguo671', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo671', '17373960671', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (683, 4, 'yangguo672', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo672', '17373960672', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (684, 4, 'yangguo673', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo673', '17373960673', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (685, 4, 'yangguo674', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo674', '17373960674', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (686, 4, 'yangguo675', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo675', '17373960675', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (687, 4, 'yangguo676', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo676', '17373960676', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (688, 4, 'yangguo677', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo677', '17373960677', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (689, 4, 'yangguo678', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo678', '17373960678', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (690, 4, 'yangguo679', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo679', '17373960679', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (691, 4, 'yangguo680', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo680', '17373960680', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (692, 4, 'yangguo681', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo681', '17373960681', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (693, 4, 'yangguo682', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo682', '17373960682', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (694, 4, 'yangguo683', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo683', '17373960683', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (695, 4, 'yangguo684', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo684', '17373960684', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (696, 4, 'yangguo685', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo685', '17373960685', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (697, 4, 'yangguo686', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo686', '17373960686', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (698, 4, 'yangguo687', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo687', '17373960687', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (699, 4, 'yangguo688', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo688', '17373960688', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (700, 4, 'yangguo689', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo689', '17373960689', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (701, 4, 'yangguo690', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo690', '17373960690', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (702, 4, 'yangguo691', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo691', '17373960691', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (703, 4, 'yangguo692', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo692', '17373960692', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (704, 4, 'yangguo693', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo693', '17373960693', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (705, 4, 'yangguo694', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo694', '17373960694', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (706, 4, 'yangguo695', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo695', '17373960695', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (707, 4, 'yangguo696', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo696', '17373960696', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (708, 4, 'yangguo697', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo697', '17373960697', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (709, 4, 'yangguo698', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo698', '17373960698', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (710, 4, 'yangguo699', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo699', '17373960699', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (711, 4, 'yangguo700', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo700', '17373960700', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (712, 4, 'yangguo701', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo701', '17373960701', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (713, 4, 'yangguo702', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo702', '17373960702', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (714, 4, 'yangguo703', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo703', '17373960703', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (715, 4, 'yangguo704', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo704', '17373960704', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (716, 4, 'yangguo705', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo705', '17373960705', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (717, 4, 'yangguo706', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo706', '17373960706', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (718, 4, 'yangguo707', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo707', '17373960707', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (719, 4, 'yangguo708', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo708', '17373960708', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (720, 4, 'yangguo709', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo709', '17373960709', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (721, 4, 'yangguo710', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo710', '17373960710', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (722, 4, 'yangguo711', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo711', '17373960711', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (723, 4, 'yangguo712', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo712', '17373960712', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (724, 4, 'yangguo713', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo713', '17373960713', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (725, 4, 'yangguo714', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo714', '17373960714', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (726, 4, 'yangguo715', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo715', '17373960715', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (727, 4, 'yangguo716', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo716', '17373960716', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (728, 4, 'yangguo717', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo717', '17373960717', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (729, 4, 'yangguo718', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo718', '17373960718', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (730, 4, 'yangguo719', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo719', '17373960719', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (731, 4, 'yangguo720', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo720', '17373960720', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (732, 4, 'yangguo721', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo721', '17373960721', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (733, 4, 'yangguo722', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo722', '17373960722', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (734, 4, 'yangguo723', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo723', '17373960723', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (735, 4, 'yangguo724', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo724', '17373960724', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (736, 4, 'yangguo725', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo725', '17373960725', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (737, 4, 'yangguo726', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo726', '17373960726', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (738, 4, 'yangguo727', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo727', '17373960727', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (739, 4, 'yangguo728', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo728', '17373960728', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (740, 4, 'yangguo729', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo729', '17373960729', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (741, 4, 'yangguo730', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo730', '17373960730', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (742, 4, 'yangguo731', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo731', '17373960731', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (743, 4, 'yangguo732', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo732', '17373960732', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (744, 4, 'yangguo733', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo733', '17373960733', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (745, 4, 'yangguo734', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo734', '17373960734', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (746, 4, 'yangguo735', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo735', '17373960735', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (747, 4, 'yangguo736', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo736', '17373960736', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (748, 4, 'yangguo737', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo737', '17373960737', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (749, 4, 'yangguo738', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo738', '17373960738', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (750, 4, 'yangguo739', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo739', '17373960739', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (751, 4, 'yangguo740', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo740', '17373960740', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (752, 4, 'yangguo741', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo741', '17373960741', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (753, 4, 'yangguo742', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo742', '17373960742', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (754, 4, 'yangguo743', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo743', '17373960743', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (755, 4, 'yangguo744', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo744', '17373960744', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (756, 4, 'yangguo745', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo745', '17373960745', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (757, 4, 'yangguo746', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo746', '17373960746', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (758, 4, 'yangguo747', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo747', '17373960747', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (759, 4, 'yangguo748', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo748', '17373960748', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (760, 4, 'yangguo749', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo749', '17373960749', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (761, 4, 'yangguo750', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo750', '17373960750', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (762, 4, 'yangguo751', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo751', '17373960751', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (763, 4, 'yangguo752', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo752', '17373960752', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (764, 4, 'yangguo753', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo753', '17373960753', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (765, 4, 'yangguo754', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo754', '17373960754', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (766, 4, 'yangguo755', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo755', '17373960755', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (767, 4, 'yangguo756', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo756', '17373960756', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (768, 4, 'yangguo757', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo757', '17373960757', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (769, 4, 'yangguo758', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo758', '17373960758', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (770, 4, 'yangguo759', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo759', '17373960759', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (771, 4, 'yangguo760', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo760', '17373960760', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (772, 4, 'yangguo761', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo761', '17373960761', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (773, 4, 'yangguo762', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo762', '17373960762', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (774, 4, 'yangguo763', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo763', '17373960763', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (775, 4, 'yangguo764', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo764', '17373960764', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (776, 4, 'yangguo765', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo765', '17373960765', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (777, 4, 'yangguo766', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo766', '17373960766', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (778, 4, 'yangguo767', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo767', '17373960767', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (779, 4, 'yangguo768', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo768', '17373960768', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (780, 4, 'yangguo769', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo769', '17373960769', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (781, 4, 'yangguo770', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo770', '17373960770', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (782, 4, 'yangguo771', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo771', '17373960771', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (783, 4, 'yangguo772', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo772', '17373960772', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (784, 4, 'yangguo773', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo773', '17373960773', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (785, 4, 'yangguo774', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo774', '17373960774', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (786, 4, 'yangguo775', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo775', '17373960775', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (787, 4, 'yangguo776', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo776', '17373960776', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (788, 4, 'yangguo777', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo777', '17373960777', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (789, 4, 'yangguo778', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo778', '17373960778', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (790, 4, 'yangguo779', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo779', '17373960779', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (791, 4, 'yangguo780', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo780', '17373960780', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (792, 4, 'yangguo781', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo781', '17373960781', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (793, 4, 'yangguo782', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo782', '17373960782', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (794, 4, 'yangguo783', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo783', '17373960783', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (795, 4, 'yangguo784', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo784', '17373960784', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (796, 4, 'yangguo785', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo785', '17373960785', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (797, 4, 'yangguo786', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo786', '17373960786', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (798, 4, 'yangguo787', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo787', '17373960787', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (799, 4, 'yangguo788', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo788', '17373960788', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (800, 4, 'yangguo789', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo789', '17373960789', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (801, 4, 'yangguo790', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo790', '17373960790', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (802, 4, 'yangguo791', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo791', '17373960791', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (803, 4, 'yangguo792', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo792', '17373960792', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (804, 4, 'yangguo793', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo793', '17373960793', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (805, 4, 'yangguo794', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo794', '17373960794', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (806, 4, 'yangguo795', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo795', '17373960795', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (807, 4, 'yangguo796', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo796', '17373960796', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (808, 4, 'yangguo797', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo797', '17373960797', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (809, 4, 'yangguo798', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo798', '17373960798', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (810, 4, 'yangguo799', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo799', '17373960799', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (811, 4, 'yangguo800', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo800', '17373960800', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (812, 4, 'yangguo801', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo801', '17373960801', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (813, 4, 'yangguo802', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo802', '17373960802', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (814, 4, 'yangguo803', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo803', '17373960803', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (815, 4, 'yangguo804', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo804', '17373960804', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (816, 4, 'yangguo805', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo805', '17373960805', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (817, 4, 'yangguo806', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo806', '17373960806', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (818, 4, 'yangguo807', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo807', '17373960807', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (819, 4, 'yangguo808', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo808', '17373960808', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (820, 4, 'yangguo809', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo809', '17373960809', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (821, 4, 'yangguo810', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo810', '17373960810', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (822, 4, 'yangguo811', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo811', '17373960811', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (823, 4, 'yangguo812', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo812', '17373960812', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (824, 4, 'yangguo813', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo813', '17373960813', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (825, 4, 'yangguo814', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo814', '17373960814', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (826, 4, 'yangguo815', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo815', '17373960815', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (827, 4, 'yangguo816', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo816', '17373960816', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (828, 4, 'yangguo817', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo817', '17373960817', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (829, 4, 'yangguo818', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo818', '17373960818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (830, 4, 'yangguo819', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo819', '17373960819', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (831, 4, 'yangguo820', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo820', '17373960820', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (832, 4, 'yangguo821', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo821', '17373960821', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (833, 4, 'yangguo822', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo822', '17373960822', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (834, 4, 'yangguo823', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo823', '17373960823', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (835, 4, 'yangguo824', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo824', '17373960824', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (836, 4, 'yangguo825', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo825', '17373960825', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (837, 4, 'yangguo826', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo826', '17373960826', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (838, 4, 'yangguo827', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo827', '17373960827', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (839, 4, 'yangguo828', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo828', '17373960828', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (840, 4, 'yangguo829', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo829', '17373960829', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (841, 4, 'yangguo830', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo830', '17373960830', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (842, 4, 'yangguo831', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo831', '17373960831', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (843, 4, 'yangguo832', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo832', '17373960832', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (844, 4, 'yangguo833', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo833', '17373960833', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (845, 4, 'yangguo834', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo834', '17373960834', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (846, 4, 'yangguo835', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo835', '17373960835', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (847, 4, 'yangguo836', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo836', '17373960836', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (848, 4, 'yangguo837', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo837', '17373960837', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (849, 4, 'yangguo838', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo838', '17373960838', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (850, 4, 'yangguo839', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo839', '17373960839', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (851, 4, 'yangguo840', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo840', '17373960840', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (852, 4, 'yangguo841', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo841', '17373960841', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (853, 4, 'yangguo842', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo842', '17373960842', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (854, 4, 'yangguo843', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo843', '17373960843', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (855, 4, 'yangguo844', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo844', '17373960844', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (856, 4, 'yangguo845', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo845', '17373960845', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (857, 4, 'yangguo846', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo846', '17373960846', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (858, 4, 'yangguo847', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo847', '17373960847', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (859, 4, 'yangguo848', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo848', '17373960848', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (860, 4, 'yangguo849', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo849', '17373960849', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (861, 4, 'yangguo850', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo850', '17373960850', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (862, 4, 'yangguo851', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo851', '17373960851', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (863, 4, 'yangguo852', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo852', '17373960852', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (864, 4, 'yangguo853', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo853', '17373960853', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (865, 4, 'yangguo854', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo854', '17373960854', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (866, 4, 'yangguo855', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo855', '17373960855', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (867, 4, 'yangguo856', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo856', '17373960856', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (868, 4, 'yangguo857', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo857', '17373960857', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (869, 4, 'yangguo858', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo858', '17373960858', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (870, 4, 'yangguo859', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo859', '17373960859', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (871, 4, 'yangguo860', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo860', '17373960860', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (872, 4, 'yangguo861', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo861', '17373960861', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (873, 4, 'yangguo862', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo862', '17373960862', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (874, 4, 'yangguo863', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo863', '17373960863', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (875, 4, 'yangguo864', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo864', '17373960864', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (876, 4, 'yangguo865', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo865', '17373960865', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (877, 4, 'yangguo866', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo866', '17373960866', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (878, 4, 'yangguo867', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo867', '17373960867', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (879, 4, 'yangguo868', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo868', '17373960868', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (880, 4, 'yangguo869', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo869', '17373960869', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (881, 4, 'yangguo870', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo870', '17373960870', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (882, 4, 'yangguo871', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo871', '17373960871', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (883, 4, 'yangguo872', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo872', '17373960872', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (884, 4, 'yangguo873', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo873', '17373960873', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (885, 4, 'yangguo874', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo874', '17373960874', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (886, 4, 'yangguo875', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo875', '17373960875', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (887, 4, 'yangguo876', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo876', '17373960876', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (888, 4, 'yangguo877', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo877', '17373960877', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (889, 4, 'yangguo878', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo878', '17373960878', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (890, 4, 'yangguo879', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo879', '17373960879', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (891, 4, 'yangguo880', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo880', '17373960880', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (892, 4, 'yangguo881', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo881', '17373960881', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (893, 4, 'yangguo882', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo882', '17373960882', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (894, 4, 'yangguo883', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo883', '17373960883', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (895, 4, 'yangguo884', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo884', '17373960884', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (896, 4, 'yangguo885', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo885', '17373960885', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (897, 4, 'yangguo886', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo886', '17373960886', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (898, 4, 'yangguo887', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo887', '17373960887', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (899, 4, 'yangguo888', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo888', '17373960888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (900, 4, 'yangguo889', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo889', '17373960889', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (901, 4, 'yangguo890', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo890', '17373960890', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (902, 4, 'yangguo891', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo891', '17373960891', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (903, 4, 'yangguo892', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo892', '17373960892', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (904, 4, 'yangguo893', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo893', '17373960893', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (905, 4, 'yangguo894', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo894', '17373960894', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (906, 4, 'yangguo895', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo895', '17373960895', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (907, 4, 'yangguo896', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo896', '17373960896', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (908, 4, 'yangguo897', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo897', '17373960897', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (909, 4, 'yangguo898', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo898', '17373960898', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (910, 4, 'yangguo899', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo899', '17373960899', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (911, 4, 'yangguo900', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo900', '17373960900', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (912, 4, 'yangguo901', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo901', '17373960901', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (913, 4, 'yangguo902', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo902', '17373960902', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (914, 4, 'yangguo903', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo903', '17373960903', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (915, 4, 'yangguo904', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo904', '17373960904', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (916, 4, 'yangguo905', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo905', '17373960905', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (917, 4, 'yangguo906', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo906', '17373960906', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (918, 4, 'yangguo907', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo907', '17373960907', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (919, 4, 'yangguo908', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo908', '17373960908', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (920, 4, 'yangguo909', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo909', '17373960909', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (921, 4, 'yangguo910', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo910', '17373960910', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (922, 4, 'yangguo911', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo911', '17373960911', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (923, 4, 'yangguo912', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo912', '17373960912', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (924, 4, 'yangguo913', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo913', '17373960913', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (925, 4, 'yangguo914', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo914', '17373960914', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (926, 4, 'yangguo915', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo915', '17373960915', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (927, 4, 'yangguo916', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo916', '17373960916', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (928, 4, 'yangguo917', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo917', '17373960917', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (929, 4, 'yangguo918', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo918', '17373960918', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (930, 4, 'yangguo919', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo919', '17373960919', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (931, 4, 'yangguo920', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo920', '17373960920', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (932, 4, 'yangguo921', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo921', '17373960921', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (933, 4, 'yangguo922', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo922', '17373960922', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (934, 4, 'yangguo923', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo923', '17373960923', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (935, 4, 'yangguo924', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo924', '17373960924', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (936, 4, 'yangguo925', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo925', '17373960925', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (937, 4, 'yangguo926', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo926', '17373960926', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (938, 4, 'yangguo927', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo927', '17373960927', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (939, 4, 'yangguo928', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo928', '17373960928', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (940, 4, 'yangguo929', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo929', '17373960929', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (941, 4, 'yangguo930', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo930', '17373960930', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (942, 4, 'yangguo931', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo931', '17373960931', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (943, 4, 'yangguo932', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo932', '17373960932', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (944, 4, 'yangguo933', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo933', '17373960933', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (945, 4, 'yangguo934', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo934', '17373960934', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (946, 4, 'yangguo935', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo935', '17373960935', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (947, 4, 'yangguo936', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo936', '17373960936', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (948, 4, 'yangguo937', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo937', '17373960937', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (949, 4, 'yangguo938', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo938', '17373960938', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (950, 4, 'yangguo939', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo939', '17373960939', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (951, 4, 'yangguo940', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo940', '17373960940', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (952, 4, 'yangguo941', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo941', '17373960941', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (953, 4, 'yangguo942', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo942', '17373960942', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (954, 4, 'yangguo943', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo943', '17373960943', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (955, 4, 'yangguo944', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo944', '17373960944', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (956, 4, 'yangguo945', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo945', '17373960945', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (957, 4, 'yangguo946', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo946', '17373960946', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (958, 4, 'yangguo947', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo947', '17373960947', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (959, 4, 'yangguo948', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo948', '17373960948', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (960, 4, 'yangguo949', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo949', '17373960949', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (961, 4, 'yangguo950', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo950', '17373960950', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (962, 4, 'yangguo951', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo951', '17373960951', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (963, 4, 'yangguo952', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo952', '17373960952', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (964, 4, 'yangguo953', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo953', '17373960953', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (965, 4, 'yangguo954', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo954', '17373960954', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (966, 4, 'yangguo955', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo955', '17373960955', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (967, 4, 'yangguo956', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo956', '17373960956', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (968, 4, 'yangguo957', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo957', '17373960957', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (969, 4, 'yangguo958', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo958', '17373960958', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (970, 4, 'yangguo959', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo959', '17373960959', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (971, 4, 'yangguo960', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo960', '17373960960', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (972, 4, 'yangguo961', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo961', '17373960961', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (973, 4, 'yangguo962', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo962', '17373960962', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (974, 4, 'yangguo963', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo963', '17373960963', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (975, 4, 'yangguo964', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo964', '17373960964', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (976, 4, 'yangguo965', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo965', '17373960965', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (977, 4, 'yangguo966', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo966', '17373960966', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (978, 4, 'yangguo967', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo967', '17373960967', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (979, 4, 'yangguo968', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo968', '17373960968', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (980, 4, 'yangguo969', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo969', '17373960969', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (981, 4, 'yangguo970', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo970', '17373960970', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (982, 4, 'yangguo971', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo971', '17373960971', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (983, 4, 'yangguo972', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo972', '17373960972', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (984, 4, 'yangguo973', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo973', '17373960973', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (985, 4, 'yangguo974', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo974', '17373960974', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (986, 4, 'yangguo975', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo975', '17373960975', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (987, 4, 'yangguo976', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo976', '17373960976', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (988, 4, 'yangguo977', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo977', '17373960977', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (989, 4, 'yangguo978', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo978', '17373960978', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (990, 4, 'yangguo979', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo979', '17373960979', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (991, 4, 'yangguo980', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo980', '17373960980', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (992, 4, 'yangguo981', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo981', '17373960981', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (993, 4, 'yangguo982', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo982', '17373960982', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (994, 4, 'yangguo983', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo983', '17373960983', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (995, 4, 'yangguo984', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo984', '17373960984', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (996, 4, 'yangguo985', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo985', '17373960985', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (997, 4, 'yangguo986', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo986', '17373960986', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (998, 4, 'yangguo987', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo987', '17373960987', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (999, 4, 'yangguo988', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo988', '17373960988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1000, 4, 'yangguo989', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo989', '17373960989', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1001, 4, 'yangguo990', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo990', '17373960990', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1002, 4, 'yangguo991', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo991', '17373960991', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1003, 4, 'yangguo992', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo992', '17373960992', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1004, 4, 'yangguo993', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo993', '17373960993', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1005, 4, 'yangguo994', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo994', '17373960994', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1006, 4, 'yangguo995', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo995', '17373960995', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1007, 4, 'yangguo996', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo996', '17373960996', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1008, 4, 'yangguo997', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo997', '17373960997', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1009, 4, 'yangguo998', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo998', '17373960998', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1010, 4, 'yangguo999', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo999', '17373960999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (1011, 4, 'yangguo1000', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo1000', '173739601000', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth_point` int(11) NULL DEFAULT NULL,
  `default_status` int(1) NULL DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) NULL DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(1) NULL DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(1) NULL DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(1) NULL DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(1) NULL DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(1) NULL DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(1) NULL DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
INSERT INTO `ums_member_level` VALUES (1, '黄金会员', 1000, 0, 199.00, 5, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (2, '白金会员', 5000, 0, 99.00, 10, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (3, '钻石会员', 15000, 0, 69.00, 15, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (4, '普通会员', 1, 1, 199.00, 20, 1, 1, 1, 1, 0, 0, NULL);

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_type` int(1) NULL DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `tag_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和标签关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员与产品分类关系表（用户喜欢的分类）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_status` int(1) NULL DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
INSERT INTO `ums_member_receive_address` VALUES (1, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `ums_member_receive_address` VALUES (3, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '福田区', '清水河街道');
INSERT INTO `ums_member_receive_address` VALUES (4, 1, '大梨', '18033441849', 1, '518000', '广东省', '深圳市', '福田区', '东晓街道');

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(11) NULL DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int(11) NULL DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int(11) NULL DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员积分成长规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `consume_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) NULL DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) NULL DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) NULL DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) NULL DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) NULL DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) NULL DEFAULT NULL,
  `collect_subject_count` int(11) NULL DEFAULT NULL,
  `collect_topic_count` int(11) NULL DEFAULT NULL,
  `collect_comment_count` int(11) NULL DEFAULT NULL,
  `invite_friend_count` int(11) NULL DEFAULT NULL,
  `recent_order_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员统计信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_order_count` int(11) NULL DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth` int(11) NULL DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int(11) NULL DEFAULT NULL COMMENT '赠送积分',
  `type` int(1) NULL DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` int(1) NULL DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端资源路径',
  `status` int(1) NULL DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES (1, 0, '商品', NULL, NULL, 0, NULL, 1, '2018-09-29 16:15:14', 0);
INSERT INTO `ums_permission` VALUES (2, 1, '商品列表', 'pms:product:read', NULL, 1, '/pms/product/index', 1, '2018-09-29 16:17:01', 0);
INSERT INTO `ums_permission` VALUES (3, 1, '添加商品', 'pms:product:create', NULL, 1, '/pms/product/add', 1, '2018-09-29 16:18:51', 0);
INSERT INTO `ums_permission` VALUES (4, 1, '商品分类', 'pms:productCategory:read', NULL, 1, '/pms/productCate/index', 1, '2018-09-29 16:23:07', 0);
INSERT INTO `ums_permission` VALUES (5, 1, '商品类型', 'pms:productAttribute:read', NULL, 1, '/pms/productAttr/index', 1, '2018-09-29 16:24:43', 0);
INSERT INTO `ums_permission` VALUES (6, 1, '品牌管理', 'pms:brand:read', NULL, 1, '/pms/brand/index', 1, '2018-09-29 16:25:45', 0);
INSERT INTO `ums_permission` VALUES (7, 2, '编辑商品', 'pms:product:update', NULL, 2, '/pms/product/updateProduct', 1, '2018-09-29 16:34:23', 0);
INSERT INTO `ums_permission` VALUES (8, 2, '删除商品', 'pms:product:delete', NULL, 2, '/pms/product/delete', 1, '2018-09-29 16:38:33', 0);
INSERT INTO `ums_permission` VALUES (9, 4, '添加商品分类', 'pms:productCategory:create', NULL, 2, '/pms/productCate/create', 1, '2018-09-29 16:43:23', 0);
INSERT INTO `ums_permission` VALUES (10, 4, '修改商品分类', 'pms:productCategory:update', NULL, 2, '/pms/productCate/update', 1, '2018-09-29 16:43:55', 0);
INSERT INTO `ums_permission` VALUES (11, 4, '删除商品分类', 'pms:productCategory:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:44:38', 0);
INSERT INTO `ums_permission` VALUES (12, 5, '添加商品类型', 'pms:productAttribute:create', NULL, 2, '/pms/productAttr/create', 1, '2018-09-29 16:45:25', 0);
INSERT INTO `ums_permission` VALUES (13, 5, '修改商品类型', 'pms:productAttribute:update', NULL, 2, '/pms/productAttr/update', 1, '2018-09-29 16:48:08', 0);
INSERT INTO `ums_permission` VALUES (14, 5, '删除商品类型', 'pms:productAttribute:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:48:44', 0);
INSERT INTO `ums_permission` VALUES (15, 6, '添加品牌', 'pms:brand:create', NULL, 2, '/pms/brand/add', 1, '2018-09-29 16:49:34', 0);
INSERT INTO `ums_permission` VALUES (16, 6, '修改品牌', 'pms:brand:update', NULL, 2, '/pms/brand/update', 1, '2018-09-29 16:50:55', 0);
INSERT INTO `ums_permission` VALUES (17, 6, '删除品牌', 'pms:brand:delete', NULL, 2, '/pms/brand/delete', 1, '2018-09-29 16:50:59', 0);
INSERT INTO `ums_permission` VALUES (18, 0, '首页', NULL, NULL, 0, NULL, 1, '2018-09-29 16:51:57', 0);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) NULL DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (1, '商品管理员', '商品管理员', 0, '2018-09-30 15:46:11', 1, 0);
INSERT INTO `ums_role` VALUES (2, '商品分类管理员', '商品分类管理员', 0, '2018-09-30 15:53:45', 1, 0);
INSERT INTO `ums_role` VALUES (3, '商品类型管理员', '商品类型管理员', 0, '2018-09-30 15:53:56', 1, 0);
INSERT INTO `ums_role` VALUES (4, '品牌管理员', '品牌管理员', 0, '2018-09-30 15:54:12', 1, 0);

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色和权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES (1, 1, 1);
INSERT INTO `ums_role_permission_relation` VALUES (2, 1, 2);
INSERT INTO `ums_role_permission_relation` VALUES (3, 1, 3);
INSERT INTO `ums_role_permission_relation` VALUES (4, 1, 7);
INSERT INTO `ums_role_permission_relation` VALUES (5, 1, 8);
INSERT INTO `ums_role_permission_relation` VALUES (6, 2, 4);
INSERT INTO `ums_role_permission_relation` VALUES (7, 2, 9);
INSERT INTO `ums_role_permission_relation` VALUES (8, 2, 10);
INSERT INTO `ums_role_permission_relation` VALUES (9, 2, 11);
INSERT INTO `ums_role_permission_relation` VALUES (10, 3, 5);
INSERT INTO `ums_role_permission_relation` VALUES (11, 3, 12);
INSERT INTO `ums_role_permission_relation` VALUES (12, 3, 13);
INSERT INTO `ums_role_permission_relation` VALUES (13, 3, 14);
INSERT INTO `ums_role_permission_relation` VALUES (14, 4, 6);
INSERT INTO `ums_role_permission_relation` VALUES (15, 4, 15);
INSERT INTO `ums_role_permission_relation` VALUES (16, 4, 16);
INSERT INTO `ums_role_permission_relation` VALUES (17, 4, 17);

SET FOREIGN_KEY_CHECKS = 1;
