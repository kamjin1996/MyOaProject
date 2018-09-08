/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.1.30-community : Database - oa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oa` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `oa`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values 
('2',1,'flow/leave.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1534486957231\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"leaveProcess\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\r\n    <startEvent id=\"_2\" name=\"StartEvent\"/>\r\n    <endEvent id=\"_3\" name=\"EndEvent\"/>\r\n    <userTask activiti:assignee=\"${staff}\" activiti:exclusive=\"true\" id=\"_4\" name=\"LeaveTask\"/>\r\n    <userTask activiti:assignee=\"group\" activiti:exclusive=\"true\" id=\"_5\" name=\"GroupTask\"/>\r\n    <userTask activiti:assignee=\"manager\" activiti:exclusive=\"true\" id=\"_6\" name=\"ManagerTask\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"_7\" name=\"ExclusiveGateway\"/>\r\n    <sequenceFlow id=\"_8\" sourceRef=\"_2\" targetRef=\"_4\"/>\r\n    <sequenceFlow id=\"_9\" sourceRef=\"_4\" targetRef=\"_7\"/>\r\n    <sequenceFlow id=\"_10\" sourceRef=\"_7\" targetRef=\"_5\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${days<=3}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_11\" sourceRef=\"_7\" targetRef=\"_6\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${days>3}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_12\" sourceRef=\"_5\" targetRef=\"_3\"/>\r\n    <sequenceFlow id=\"_13\" sourceRef=\"_6\" targetRef=\"_3\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"leaveProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"300.0\" y=\"-5.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_3\" id=\"Shape-_3\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"345.0\" y=\"555.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_4\" id=\"Shape-_4\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"300.0\" y=\"130.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"140.0\" y=\"420.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_6\" id=\"Shape-_6\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"475.0\" y=\"425.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_7\" id=\"Shape-_7\" isMarkerVisible=\"false\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"325.0\" y=\"305.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"_6\" targetElement=\"_3\">\r\n        <omgdi:waypoint x=\"515.0\" y=\"480.0\"/>\r\n        <omgdi:waypoint x=\"515.0\" y=\"540.0\"/>\r\n        <omgdi:waypoint x=\"377.0\" y=\"571.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"_5\" targetElement=\"_3\">\r\n        <omgdi:waypoint x=\"170.0\" y=\"475.0\"/>\r\n        <omgdi:waypoint x=\"170.0\" y=\"520.0\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"571.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_2\" targetElement=\"_4\">\r\n        <omgdi:waypoint x=\"316.0\" y=\"27.0\"/>\r\n        <omgdi:waypoint x=\"316.0\" y=\"130.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"_4\" targetElement=\"_7\">\r\n        <omgdi:waypoint x=\"341.0\" y=\"185.0\"/>\r\n        <omgdi:waypoint x=\"341.0\" y=\"305.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"_7\" targetElement=\"_6\">\r\n        <omgdi:waypoint x=\"357.0\" y=\"321.0\"/>\r\n        <omgdi:waypoint x=\"475.0\" y=\"452.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"_7\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"325.0\" y=\"321.0\"/>\r\n        <omgdi:waypoint x=\"225.0\" y=\"447.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-2.0\" width=\"0.0\" x=\"0.0\" y=\"-2.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),
('3',1,'flow/leave.leaveProcess.png','1','塒NG\r\n\Z\n\0\0\0\rIHDR\0\0:\0\0Z\0\0\0&柬歕0\04WIDATx陧?榎\e?鸢?.ㄈ(2?\\d訯?櫻枊b凞Q玂濌吘?陌鉫@?(?????a?4\"?慚	AE?ヮ諁+濐t嘥ИN~象>蛰昢騐}u西?i@罷-戟#?漴??戗铍氆査錴ww?Gq??鼭\'瀤?z琛镏1\0犲=鹄o锅鈰o>彀摸4c茖陾奎尻??^胶?踉S諘+WV.\\X戒扠?|??r萶?罡O桱ョ隲"\0蠷\"?弘z嫣櫹渮戛折n画?袑这艐玤焳v趵|烊#徿WG€枑鲡渜??~誆?U7?~駤辍?橛?Н痮?\0歠摘U嵇鸳>踉檊瀁}粞G珝?q畔{鳿re\0M戹浃恠蛏\'W?V碥s蟷j轶;::6譵\0`sr裔\'g<B蝷覱?铑畀?\0把莍NN?W0謱3)椝?\0尰t?J+??A公玨咘:\0栏K缟IK??s纥猏\.\0栏Ig<N\'躕{s,Y蹭蒍瘔蒤0栏?o扪閷倾9y$}}}+?{籊\0橼U椴蚿趇?*椝s<\n\0栏H鐻桩j?圇E泄蹋\0\0寢t騮佄fo~筵:K<\n\0栏栝?糪n?\ZAg礕\04攡縂\0?3M埽?{t\0€qs訯G璶?潟+W.5G\07\'減?蚙uu誙W}溪+\0`芴?绔?徫琘虫:?\00n9鋹?|鹆?崽全? ?\0W?v谻鸝W,H嚟顅?\0`\\}闟?嵩SO}fc濋缨蟯鮮\0`荃貂m1m诖U?/?!鏕?UioN㏕z绢\0鉵嫣檽9鋹?}粞q\r9?奐G?]\06殐:杩O;泶\'苢b颡?>8屯筙?€?M?s鎁g焳鰮?vVw躴_O缤I囀t\0hJ貦6m邝>鞴淆岜?k蒯獜i蝰e驽\0\0M;===?t蠥忺靏?哊<晒貫\0爀?幂葺藥?籠"瓞厢.糪"往IL<\0ZR?揺偬<?折埯汼O=u裓r7躳飱+V>踉S僕!O杓蚴+疦梪Hg<?湥?\0贐椵?＄?~~\Z瘞埒?q鸗躻r含?\0EB?忷;漒0\0?t.庩?\0爤A玷,薔?\0爌?O缘:\0NOO蟔査暹?\0PHt朑頎\0@兾Y栱?\0@兾It>?\0@徜鯸r漒0\0\n*疆\\.摺\0@兾ft腴閥瀗\0\0?Aga恨昇\0\0E:珑y>]\'\0€聣恠H劃su\0(溛挝wF轩丯\0\0匰*暥误鴓輁0\0\n\.?乬\'漒0\0?t?象?\0P8rN尠3G\'\0€聣惓_杄楇\0P8旿e?;麝\0PD汥衴$蠇?\0(?:邚晷	\0爌?;\'?漒0\0\n\.,象t\0(淛ヲ?;逢\0P8S?偽c涬\0P8y?\"瞬7?\0P8錼鵮t簍\0(?蠌?Y\'\0€漏T*?椝W?\0P8i?:?\0PHt娎髍漒0\0?t鎃*暯u\0(???u\0(?藌隋??\0P臓螃<??\0P8应M麐r裹x__??\0N滶旿?:\0N炵_壈s€N\0\0厯e賾Qg?\0P8y烇u僋\0\0呌圹籑杄?\0PH錼Jヲ*漒0\0\n\'瞬颋貦?\0@酓腮l劃鉼\0(??#靯S\'\0€?旿瘝狊+漒0\0\ng鲮贈F轩迷㏒_?\0@酓轩Qgg?:\01铚楃?漒0\0\n\'厹vt\0(渢?偽漒0\0\n\'MDN捰膁輁0\0\n\'偽漣┕N\0\0E:週\'?\0爌襡 \"禳砃\0\0E:垹?漒0\0\n\'B潍ｎ?\0爯?{阜穡漒0\0\n\'象Ⅵ?\0爌?;砛\.?\0@酓腮h炵_?\0爤Ag法E:\0N__?t?m赺?\0P8y?巣\0\0匰.?嶊?\0爤A鐦<??\0@酺*暯#焯?\0爌Jヒ???\0@!E衴0?:\01鑌\]㏕薤\0@兾)y??\0@醖Y?a鏺:\01杓!偽漒0\0\nВ?:彆J?u\0(?:?㏕*o?\0爌??挛莟\0(??嫚s禢\0\0?!??漒0\0\n┘8偽#襻&?\0N漘G噘Q\'\0€律察?;\0P8r鍰椭	\0爤A?Y杴K\'\0€漏T*+挛?\0?tV旿キ?\0(?:?堹G漒0\0?t瓮瞝\0\0E:E澂\0@徜y緖潊:\0NOO象\"?V惠-傁乊枬盅驯诡\0\0m*?绿鹃d丵s沣\'R徘語齈梊0€禨洆S]WE棂\'?\0?靄\6J刭M梊0€禩*暈af?!g郭9\0@[瞬祉jV\r:y?Uw\0€\"劃櫭滔賅g\0€B坧sq]轩c:+\0@!枣??漘?\0P(y烇!\'滸鏥輁0\0\n\'B?Qw?\0癆赕w輚譭,5譢\S?o瀦5陯7搌洦n?\0h)滠t覯諘+WV焲騃?跣CUo羔咷\"魘?\0Z@趽#?4?9o藜%瀁\0?裔*ケA鏸?\0hi~塸茵燬跆€6\n:蜿]縗\]<育?N_l\0h霠酬醗折瘹Uw?盕ク?A\0?柢辐虻B蜙菘x畃#鑌0@??雸A\'輁'?:\0卸A琏y矴:?酕?\0AG?\0Z-瑜UV#漷焢#鑌0@?潵7?b蠭?7?\0磎轩聿郦穇}纶嚟鈑?酕?€禱r:╊惧⒌侼鷼`#鑌0@{漒'灗.筴秺麆A\0?瑜3遯骙#窝I?;矤\0?t瀤⒑|榈諢_y軋!g犚縄洲A\0Z>鑼?寝A\0?鑼e/魏鲱:?\0磍衴?g?A\0Z6?A\0%鑌0€?鑌0\0値?\0:?\0 ?:\0 ?A\0%鑌0€?鑌0\0mt鈁?_鳥SE筡\^泔I5k脂\r鷻?С砈?€壐G\'乵份堕{N疫眛橐量g蹶正7忡n魁鰝\0L誀3R?珄锝鬣瀾魕%梊\R輎助z齘攚倔澱椌籁儫忲3肟豁禰鉱膪}?拣玛;?x虣3坐ys嫣?p?k??\0L酄SRX?輛tt?茌葺鶌+?亏辿?眶襅?J?輲??t瞩f?4?a圜旌氘鲨\0€狊缵}鬏讱7摼緃癣j?踞鰭はg虡Q輑惩獅罟鐦~婧偽h匡罨锂{毂凎輞鐫k厾}鲑恰+\0樔A\'韻9釀F軸2瘐Gy?€x鄟聋u歕Zi锼例[o锦z豉E]???矲歍7羸?t\0`?潯{VR潀蛏凎遷遾征肩=凎?齙?w钹灆R#霆瘧~f\'g?+鹽缨O俭蝺_Osv???r饜?st\0`忪裃?\0:?\0 ?:\0€?鑌0\0値?\0:?\0:J?\0AG	:\0 ?:\0€?鑌0\0値?\0:?\0:J?\0AG	:\0 ?:\0繤t??\'嵀?t烐?€p銔7._箁覡Z秎僮\"?裉€p淼讆帔氙齼>牪a{rR葯?Q裉€/帖螞7oa:鋻鏃碽曀錴m礘絒\"鋅0\0雃鲮贈F轩揘\0\0呌蜒眣|€?旿蠅狊\0\0呌鬃稥澱:\0螖)S秺狊楴\0\0?u暝鋣N\0\0匰*暥.椝孔	\0爌*暿?椟N\'\0€麻眄?偽ot\0(淩┐m潟:\0N炵/嫚矪\'\0€麻铑?偽:\0N㏕?偽?\01杓2偽?\0N劀WG莪\0@酺*?#柢?\0@釘J\"??\0爌??偽/u\0(?蟱墵矰\'\0€?旿瘚俺X\'\0€麻觋,薾?\0爌\"浼‐\./?\0爌\"潼]設t\0(淛ヲ?:疯\0P8Y柦5偽弖\0(?9礍\'\0€律髚?:??\0爌:;;鲌狊}漒0\0?t迿琦\r:\0N筡\顖篘\'\0€律髚?:阻\0P8潩漿E貦?\0@醖Y鲛r箌昇\0\0厯琦鸤"鑌\?\0@酺*曶gY鯹漒0\0\n\'象)t.?\0爌\"鋦燶\.種\0\0?!g卡?\0爌?p杄?\0@酓?E伫哊\0\0匰.棾ǒ?\0P8y垹s㎞\0\0厯eYWd滽t\0(b虚崰?漒0\0\n\.鱁}Y\'\0€\"?]\'\0€律簏?司?\0@釘隋iQ玳\0P臓sP怨:\0N炵3?;G\'\0€\"滳\"铚?\0@酓?,挛?\0N筡\>\"牦:\0N炵GeYv狽\0\0?!?vN?\0爌叔?Q\'?\0P8y?A绯:\0N杄煂绑漒0\0?t帍爏\0\0匰.梘G潬\0@兾Вf?\0P8i~N毀?\0@幛Wi鍟N\0\0E:\'殍\0P8楝乳烊:\01鑭.偽?\0N劀覾"??\0@釘隋3??\0爤A绗,薴?\0P8r紊髚哊\0\0匰.椣?H\'\0€\"濗ⅵ?\0P8Y杴)象u\0(?9D伫?:\0N筡\?挛?\01鑌\眨\0@徜y~I杄]:\0N筡\?翹?\0@兾注2漒0\0\n\'象odYV?\0爌叔?#鑭H\'\0€聣愺???\0@釘隋oGM?\0爤Agn杄\0P8r綶㏕薤\0@釘隋+?烴\0\0E:WeY鯺漒0\0\n\'象y潩漿?\0P臓sm漺?\0P8錼;镆	\0爤A缙??\0爤A琨潩漿?\0P臓髢<蟱?\0爤AgA赃?\0P臓筱,宿?\0@兾?tv?\0爌\"潼碦┘Y\'\0€?椝?梭鼚:\01椟<瞬7?\0P8y?.旿	\0爌叔驋;昏\0P臓笏,藇?\0爤Agi㏕贗\'\0€\"澔\"杓F\'\0€\"漿*暿玹\0(b轩u?:\01柢_*暥?\0爤A鐏铑铐t\0(b衁戠t\0hkh綷Z力:J-殡脎B穃0€v:籇恲z]A\'﨧種\0m)绿椬t杤ttl甂\0@[Z譤{s\0€?℃忉骀貨\0唇,宿0t疦|3\0@Q挛逢偽鎈0\0E\n:o洺瘞\0\0?!gn?螞\0.桁哆~?n?\0@鸯U峳鑌n\0(\\葃8甏诃?\0*?剾?;\0@C蝖_\0h霅S狪廾\0P槓3繿,\0爯!??4蔀\0燻!?歞?\0P皭S靄0\0-r屹忳?鶼悋?sv\0€?9>橄gAu劃扊堇铣g\0h撿_/誹劃鷲3P紺~瞠I鲮\0\0-rF\n1鮝g耕?&9?\0碩?-靗:茞S{\0Z&洮+禳r=B涡癱?\0?!g]ag}B蝄0嚤\0€q酡Z@9w=?甛Z篭'鐥弹瘡獇飲<\0纗X撺唠冢钞ョCミ梀a}蠧\0\0l尠訄9:c	;茁r豛n\0h壈3?蜥V]??y \0写?躩ㄑ螕3趛v?蒵+\0爥VC諊扆\'嵕簀,gFN??Z\04S錦Z盾r?b值剕?氛V[?鋅0\0-c鬏w棭SiH亻?东楓謪?髱w笺t]\0毆T*m栫錼]v賓冥\r汼?l?w<8~尴沌^?\04#浼$烧QW朊胜鮛\n酒*y[葡齜?+暿泆\0豩?{S趮?汌戡+船o?騵庾擶F}\\?€?r翯稁6p捒?c?i攭邱:~?Q哽腚s?\0狇赙隳?丘-ｍ買??喺U窕?矿豇輜GG\0hd?n>蝀?=&?wQ棚焅Z礬"瞬OL\Z鹵瞈0\0?蕓滜	;铽9蟴uV?;D}?陒y灴?\0<蹛3桖8c1?g訾\\吋＃c篪?u_劃wy0€1{髊芢"碣﹏h?霓?Q\'虨={S?\00Z葃扼q柒E沭骶<k\"怾圯萁滸\0V驺4E跊鳜磜╈響\0唵淔颓i毼挝w七毹撘<?\0Lp?z{{穳藈P㏕^?€?r苨>N3m№=?鬑?赢髊諫y[?飱銠揬'O~瓽\0&F萯8c!n滕^uk|紦G\0婝8??畢粖g\0/?u>晰劃7E利E羿?S錣\0y?鷟湵觊閥^翕ⅷ?艏蕹\0?銵橓8?B牺稻|T7\0犕L澌8?vv?x[翳药SЬ@G\0?B蝿煆3V}}}[D伫B絷幐軺G\0爡檹箪鋣轞;拎!?\0?r糖賊0旿e氰萋桡封??\0碶0髊\Z谒鏒?uO魊w€婢0洀3\"銵墳畧:&>軩G\0`#3g|uuu齍赭﹁飼堰mu\06^?g#?麹豉挝w?\0?8Y劀舰缢㈢\'趝\0?r糖i?9/嫐>?:\0\rb>Nk?{靓?|2嬪q;YG\0`肅廀8-&象埱戕tq诖i?\0盀糖im浇桔D??Q\0{?腸tD簗D劄?\0屄|湺;互?觎蓳\'?WG\0`鴲c>N涥觋za<n_徢皈Q;?\0詷廠聒MOa5翹梟\0 錁廠8]]]忕?=L?e+`B2Цzzz?忢匭忥t€?r糖橽0怦愆=?覾r\0\n蟶?鶚?顴Q_K摉u€⒕鄼?A貂鮩忹縀R┘EG\0(髊H?饝?覾r\0?r糖aP葑膕酖Q叨g€v~A3嘺丗\0>5]闯硈犦B廀8??鸇-?|l|簤嶾0序糖a=C聆tnH「Ё?u€V9驺餷挛f駵鵷札z鲈\0Z顓蕓6T\n9)霥捅7€V	9驺?轲Uz.ッY榘枎\0?驺0N6I斢D?aY;\0hF?噏檄wD輷枹??栏3噸鼃K嘑繚N2楴6?\0岟嫀?lt椴轵??纗夹槒CS?偲spi篅h篜◣\0楔恈>-～厃?5瀷媆"p縑G\0x痔恰U舠騝叼荩\0<洂c>--瞬7捏??扉閥瀻\00?髊hS?象怡氦雘u€袯廀8淬蠖+=o#鬖譢r\0謆>;;G?灻_O摉u€亹c>?y蜾缙篪?兀v?\0飩颓想誑0x刵\0L?髊(瑇^?jA<?镯磔FG\0&髊?遗@k硝{泠t狓!莬&??莝~y軂r鲮贈?@17鲦?a舠Q诅y>/阤:P瑦c>^\n?fG-腱燔KG\0\n癮7?!巛1&顝1?{7?錁?#弿m??魄M]]]?\0m膢揗b?礬"象)??!莬Xrv忨rO早銔羢t?檹蟐yq糏鳹専咇駧:衂!莬h€x損H鞪铦??糖亞彥]cL?穇桦脎BG\0毞A6屏冤S_汴?b屳栫?:?檹G尡徶e懑\0\'錁?Q劀浊x?辎s献€qb>4韁r茤1鑫徯髬4u狇!莬h?:y\Z?謀r€1梃柝|攚掓鉆?筍屒[?嫃分€u垗錣#0Z愉蓳煕e贆16铼T*o?€戇>躞;/蟶h}1n?泗粮=*>軩G\0辘?Q語齪噤d驺@[絘ye屨D}Х穡;翖茊qu]蠭u儿8衺襖\?穃'E吵鬂:Lx盇<zH乳?8?5赟?岂Q砯蠟僵嶾0咻?潹UQ婚揣铑铐鈂r说1幆?-/釐N_杄PH?8諔*?斧痶\n赟跊泺w\'n遊_Ze櫰x芊p从K\0触词j]A\'jy詌潅?℃]1栵孃l\n5i罙忹擐K@vv?L癥Z[乽P:l錧*欷?邒?赈!c?E坭??dY6/>辳棂s€B?]+k凜真闌V珱遳譣?X班O譢\sMu藜yju?WT<鹄陏鐫菲诅蠠_今?枕Y艙&%?a\rwㄚ\\hU)滠t覯諘+WV焲騃5唞粞G圐鶦=T结?壭??(広*穗?//漚Y?9BN?挛擉嫱[鈾?Af??尞S袀裔*ケA鏸?(嶫ヲ??滩齑磄Ф磡腹:?h1i~塸茵燬跆俠Ksv\"丶!漇+B戌\"柢鮄|??mt栈~购x?}溇&?:0\r窅銣s伍_瑦-X?恫悆?:?^V烬猋諢}?kT鶽篛?t`?i!荋???Z華s兾}?_+?札嬬\Z▊L8rX華亗螔膻u臓擃3H榟,浒悆澺缤1瑜?PAl;昺\'値羂nL盃c!噈\'m0X余)瑜?P?l;-浒恧m胍浵1瑜?P?l;-浒恧m雘椵V烬?謣W_K??+豽Z萢跧?諸w遰裐5}袜4X炼狱F跱??馜u?蝅U|-輌€\Z琡?柝v覗?M樆沔矲>撽V绊磹枚擌\Z琌<Q]爵陉席<n膩:P檫?k飵羂n値?稘袋`m/幗;+豽Z萢跧?直炫Y邹冋`A荁跱Zv?蹛3P\n値?稘凑?e?c遶Z萢蹓燾?袍vZ萢蹓燾?E躹Z萢蹓燾?呡vZ萢蹓燾?呡vZ萢蹓燾?稘识冋`l;m;羆5X跱跱0X\rV蓝佣僽擹礿U党?=nj跔(椝?茾蜌5k儈胬螴G?t&豟=釀鷥纁?V襟?玙?(疫眛橐m份逗z蹶駍愤~{?t&赻M!鄭o|銏鱫份v?骅?捑~W髹o苛??颬齘??蠥}锕鐬?遰?k齅轺?頀K.╊从N冞搤^xau?v?嫣檏9s鎀8鄝5??t&@蠭]婷縖磆裐噭y鋺14@燥E刽襅?岿鏇坐薮?挕羉笭摼盅蜒qwww?V琗腼I?s?c\n:関譣w5XAG衋\"潛O>y峺:C兿ぺ·{隱?@?.鑌\v賓k潯!h礌揃V?踞鍪軁鬏誧?v鹁tnh趃焳V@?t楬凊鹈?=鬚u辇遷遾k彮忿z豂緄nO狯?靉9粜C?DU遬]?鞟J乗'}琿E]???3爝騾/|諽gㄛ蜪u媆"~两蠐\Z0op?鸢恧%侼\n)iO荋x`幬衆'v:\\鮼|`?1)???负鬓{鬟W?梘`牸顄?v锼H縪钴拐輜呓膈僿帼襳辻缌9;鮾蛉#?<??`畚椊靍冔?奋?訬{T&5y亣m\'r麟s燐芰\rG3Wx	:纇畚礉\Zx登{噓-?儡弃7s?狧{??幼%檫紋#-\Zi?跱&d衠?h3?y嘈誒~驌1/嶩+Q俞騃礐鱟O<壁鬃7灬鶃@1案b碋#蚟郺蹓?鑌0-tR皎呙?U尪8b??F佭5i槗?函?{亣m\'値?磝蠭{.?鐪晾r?讓iq腀鑈燂X龤?}?<7賖{XFZ难?稘:?孝畚ICE朤隯Q壳%伇~_秊楇np纝i5靮摅灹?G]难?稘:?`?X)寨艉鄠l;A?X跱跱Ve?稘稘`跱e蹓羓?稘识冋`l;m;羆5X跱跱0X\rV蓝佣僓瑎m\'?X炼遇味?惍€5碫莁}?%栊n捡棋+W?萛ZT藮-鸝?瀁 ?A?p淼讆帔氙齼>鴛+=?钝摀B吸飴鷪g:J小E?缶?[?工\'Z畴鲷趑叨逻3艼絒\"鋩牐X?宿T.梠?@?t爌\"漪D]?@惷Bx烛<?9闤漒0Z晠r莱杄贂錼y漒0ZU??ZO<駝?衘\"?+旿	爼第B帯u跽WWc{j!磼揶辪?{X\'\06L__?tV?磹?Q7?绬㏕*/庬轱tZ+?歟?:癮夯环媘?:-$B螚b`?\0╈塾;uZH?E紺\'\06L炵瘡Z?衆"f蠟絠劀U]]]/診r€\rS㏕?墼[tZD㏕?遢:搬?囏_\'燛膧?瞬藆`胾vv?ag濶@??bP~F\'\06\\lOvu甆@嬋察?cPf:袗mj)挛7tZD劀;b`N\04$梏F轩奛@?e蔞t+旿涢@C?N?O\'?辻?銸t燼壅抿<?]\'?辻|4闎漒0h豽鯓〒tZ@z?u擭\04,杼N玒uZ#鑌\?漒0hX?)碚?h?鵓㏕z筃\04l粃F浴:M州萁]茣:行爏^Zy?衐Y柦7?:行爏QT廚@?阊vN?€唍[/KgG?h瞭嫖??@C兾?:4Y臒苺躆\'\0\Z\Zt妲+橂4QGG擎礙?l?\0\r\r:邚牫嘚@E纘]芲?@脙苇旿?:?圷鳲漒0h????蚛r:A鐇漒0h醍:	h?9椙`躉\'\0\ZtH\'d?h頏糪'挛_?@眠H>茏作\"潃&殛陑a漊襻&?叙7挮#鑜??i賑?:衟浤鲺O赲0蛚穛P杄_?€艼{r?潃??梭?漒0h琂ヲ庳掐N\'牴A绂?漒0h??hn轩}㏕z塏\04V?侗w?4I淲?\\?\0崡琦胗檻u?瞬}#鑌\?\0崡畄圬[t汍n阖〒u`\\侗惍^?屑A╪漒0h嘉挝絙;O\'營?[?漒0?揝叔騖\潃&?e蔞r瀴?険1綯*m?\0\r{3Y姲骪r潃&?y?c?阺t~朜l鮛聩????澽貫~E\'燛趑酎e滼?怫譗鱂齵|灖鹴`靊?-?潃U*昢凈泷[Q乔嫝N㏕*{_:0藏n?O?h徯砓诜G袡鲉竇纷祈q|?{鲮Mu	?嬳?Q\'?础灋炵E纘庀G\0?n跬?E;? 钄gG潬P\0n^!?鯒ｎ嫼\'>R躥y灴T噣	tNJ{ut\n(峦.Q嚹 vm~螼襓樸泖F(赗噣	t螆:T\'犩:::6徚9乔韻x嵺k?(鈜7髙€?濗沂+潃	*=?>|N嬠踜髙.嬥3=决?$鑌\眨0羥wwo?槟Zq?戤?歧澖浇坭笑A绮tvd漒0諴*昢棊k?怛庚}原耨喀漉貂m@?澒表赪\'€=p鯤K4＞熸鳏?旿?骥\0-t妲7h:屬冤S_P籠"?q?n?殫&鼤Jプ?蠦A琨閸歂\0?yE簆^m疫Qw諺:|$傁Kth怫橹寸Y\'€喩簏蹰?眮鵑?Q鉱?{蜾上?`#n???寢i应鼸?實蛪q{s睃=W琼嵺繈矇.??uH豩汉篰灘Y枬稫?婜z?泠?48?怤煛@S?#潇uIl悥G-?7>py?\"]顴:磩崰sDl溇[涍筱ㄏvvv聚?`}艣φ锡搐4縗'?#鑭:陣爹=WE]㏕?牲燦㏕zNZaU粩蜅覅專猧[?@;l亩帊?b胾vl葉?泠玵革?G:慽l迶?:軡VwF=_??D蛨畜6{倎??bｖ怫?D?鮫Q?&厇摮Y:mE毾沱??i閤?_?Q磺扣R穩②$6to屶sdl\0惋鵔|?q蹜vik赐X?苧W詉1~o奪跛跊??+bL?_珋夵?北|W-?ㄍ锕\"n廕乭掶=??脐Nh蔘骄?%漖竦O榇Z?镻V:?蝧j嚫尯磛鑛傫椢晻.\ruR贺fZ?拂捻?恈＾愦\0\r?/?鰛赿鏁递鈏掦婴g俓r诱挣Wi<ソ?d甃嵑?昕?__尩mu\n`黰R[絨t??sド巗因v髙`菀檱c躄I梲kE躅f亲鰨q魊?hi9j??疂??鴁?橬h–Ldi/L椛1fE};jY簲K鞰耮襘湸7G0贒??瘴諔.Q雹v蓨>t\nj^掓亭?駖f越Q繈乡E齂鞷-)€b焀?B贓I椩雾1贞?詌濚dNi臩m錝跊y]?QqW鲎:0眑/\0W{q负6跨i瓸:讎S嫌ⅰ纟i砑S棪晥电頜檐5?6駉^;蒳\0骥?茷i穨頂糸駑怏糜橾u垗m蕯)[舠?Q嘑]?楝?怗?3漨8=7g蠟僵n熬餃_捨/(_?\nx 赈7n_4R篔w壕S何S恨S侯S湖SmR誑苩??`<傁k馀鎐馼髰趛E一?乙堠SЬ爤玺螜挅胱.蠎?=澁*]?穠?k蠑1=梿籖鱟帝/FM嫰镪?\0M??A:B熸H|?漺こ硈弙诐螞揀/?鶸]?K-p{礸?嫯診r@[K{2\"囔U;=Q繌殯鎂Dhx]浗(S拣>稙gh=濚騆?<\r绖雄刍M哛?腯槟l閰.n{覚h[鬍z64刺?辻鏤,XP]秎Yu蹶照$莓\\共z氕稸框暞T??O羿o(杳霬輁0怲*?觸寈峄?跨鲽篙?^銋]]]諊擮|??鎻點u?-ZT=罡銌濽??j\\?\0?惋?禽?⒏溅?(千ツ崢??螗?r\"?>L馀?w钴鮘n8C]y鍟站揪5e礢豵\0h?_搆玭尹瀘衤?向咜艽歡葱旜R?鲲?S輖?誇哥瀧獓r刃=;-w藭?`#J{cjъO藥锂借^X;沩槷\"]jmE匕{wjK?Vr覝汧J??欷9;PN囼褼骜璀+u@婭{]釫鵂趨躞ㄏW*曶黥?o杩O{M哊.煸漒r甹詾溼鲮9寀屎霎晕誗菪筀\r\0m菲鰍馚}m:??筅插蚸鑴嗷#焦.技~	y殦3炓湞:)糪r荐?鴚?j\\?\0?])^厉N{IjK??闬Zn胕鈗t槮~u誗O=Uo?sLsn?ｖ?=滹B?u繢?啄QN澉狷3??胢份镀斢々揪??蕄雃\r\0J{l昼苅騿,#__鮘'尷掓-]沁鳏+u\0冴I\r=i_?綵?v卓/V7.筪嵔K?1+燶0€鸂嘲v桕绲?I??烴?潺A\"]謅cJ嚿赕?房?6瑜雵yT€~)詫v灇E藯/擗A\'漌?溶楟?乱櫌k{ｆ檆??\00f鯂?.泄堡遅壳f缚J皈屪?€?澚犙?\0€\r	:-紾\0`C侼K脱\0hd衖塙W镈?\r\0犙Ag蜙?泇?€咾W韓謾?;彀g陚N稧\0hㄚyk頺卥]y4\0€啱?y痍?cq?7庹?\0\Z&]C獀1w钴q\r9W^y錦Z赘娺繐G\07鯎捇汉獁躴歉劀{罟Ш?StN複\0`\\-dY鲇鷫砷<7?o翁?Tw!蠠巚-.\0€唸囫嗿CX)?j螻趽Sr绎I縊?€崷v蚒鯂币湞\r櫊滄?9\\鮰劀}u\0hz?X嵉h癣鮚B>k脂5甮U蹞#鋅0\0蛽+障侃?湑螤紁崧c\r\\4荭98)?谉皛N幟U\0@KH卥V\r-隮閈n椐榵\0礈t灊,薔?凃ky:`炵昏\"\0幸义\"j灼歋魂a偼u?濋赨.隲0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P|耿仈蘒\0\0\0\0IEND瓸`?,1);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values 
('next.dbid','7501',4),
('schema.history','create(5.22.0.0)',1),
('schema.version','5.22.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values 
('10','leaveProcess:1:4','5','5','_4','11',NULL,'LeaveTask','userTask','admin','2018-08-24 21:33:06','2018-08-26 10:17:11',132245139,''),
('2502','leaveProcess:1:4','2501','2501','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2018-08-24 21:44:40','2018-08-24 21:44:40',27,''),
('2506','leaveProcess:1:4','2501','2501','_4','2507',NULL,'LeaveTask','userTask','admin','2018-08-24 21:44:40',NULL,NULL,''),
('5001','leaveProcess:1:4','5','5','_7',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2018-08-26 10:17:11','2018-08-26 10:17:11',27,''),
('5002','leaveProcess:1:4','5','5','_6','5003',NULL,'ManagerTask','userTask','manager','2018-08-26 10:17:11',NULL,NULL,''),
('6','leaveProcess:1:4','5','5','_2',NULL,NULL,'StartEvent','startEvent',NULL,'2018-08-24 21:33:06','2018-08-24 21:33:06',66,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values 
('12',NULL,'participant','admin',NULL,'5'),
('2508',NULL,'participant','admin',NULL,'2501'),
('5004',NULL,'participant','manager',NULL,'5');

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values 
('2501','2501',NULL,'leaveProcess:1:4','2018-08-24 21:44:40',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL),
('5','5',NULL,'leaveProcess:1:4','2018-08-24 21:33:06',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values 
('11','leaveProcess:1:4','_4','5','5','LeaveTask',NULL,NULL,NULL,'admin','2018-08-24 21:33:06',NULL,'2018-08-26 10:17:11',132245087,'completed',50,NULL,NULL,NULL,''),
('2507','leaveProcess:1:4','_4','2501','2501','LeaveTask',NULL,NULL,NULL,'admin','2018-08-24 21:44:40',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),
('5003','leaveProcess:1:4','_6','5','5','ManagerTask',NULL,NULL,NULL,'manager','2018-08-26 10:17:11',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values 
('2503','2501','2501',NULL,'days','integer',0,NULL,NULL,6,'6',NULL,'2018-08-24 21:44:40','2018-08-24 21:44:40'),
('2504','2501','2501',NULL,'staff','string',0,NULL,NULL,NULL,'admin',NULL,'2018-08-24 21:44:40','2018-08-24 21:44:40'),
('2505','2501','2501',NULL,'group','null',0,NULL,NULL,NULL,NULL,NULL,'2018-08-24 21:44:40','2018-08-24 21:44:40'),
('7','5','5',NULL,'days','integer',0,NULL,NULL,5,'5',NULL,'2018-08-24 21:33:06','2018-08-24 21:33:06'),
('8','5','5',NULL,'staff','string',0,NULL,NULL,NULL,'admin',NULL,'2018-08-24 21:33:06','2018-08-24 21:33:06'),
('9','5','5',NULL,'group','null',0,NULL,NULL,NULL,NULL,NULL,'2018-08-24 21:33:06','2018-08-24 21:33:06');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values 
('1','leave',NULL,'','2018-08-24 21:29:46');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values 
('leaveProcess:1:4',1,'http://www.activiti.org/test',NULL,'leaveProcess',1,'1','flow/leave.bpmn','flow/leave.leaveProcess.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`LOCK_TIME_`) values 
('2501',1,'2501',NULL,NULL,'leaveProcess:1:4',NULL,'_4',1,0,1,0,1,2,'',NULL,NULL),
('5',2,'5',NULL,NULL,'leaveProcess:1:4',NULL,'_6',1,0,1,0,1,2,'',NULL,NULL);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values 
('12',1,NULL,'participant','admin',NULL,'5',NULL),
('2508',1,NULL,'participant','admin',NULL,'2501',NULL),
('5004',1,NULL,'participant','manager',NULL,'5',NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`) values 
('2507',1,'2501','2501','leaveProcess:1:4','LeaveTask',NULL,NULL,'_4',NULL,'admin',NULL,50,'2018-08-24 21:44:40',NULL,NULL,1,'',NULL),
('5003',1,'5','5','leaveProcess:1:4','ManagerTask',NULL,NULL,'_6',NULL,'manager',NULL,50,'2018-08-26 10:17:11',NULL,NULL,1,'',NULL);

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values 
('2503',1,'integer','days','2501','2501',NULL,NULL,NULL,6,'6',NULL),
('2504',1,'string','staff','2501','2501',NULL,NULL,NULL,NULL,'admin',NULL),
('2505',1,'null','group','2501','2501',NULL,NULL,NULL,NULL,NULL,NULL),
('7',1,'integer','days','5','5',NULL,NULL,NULL,5,'5',NULL),
('8',1,'string','staff','5','5',NULL,NULL,NULL,NULL,'admin',NULL),
('9',1,'null','group','5','5',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_department` */

DROP TABLE IF EXISTS `t_department`;

CREATE TABLE `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `info` varchar(100) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_department` */

insert  into `t_department`(`id`,`name`,`info`,`flag`,`createtime`,`level`) values 
(1,'鐮斿彂閮?,'娴嬭瘯寮€鍙戠瓑',0,'2018-08-25 11:34:59',NULL),
(2,'浜轰簨閮?,'绠＄悊浜轰簨绛?,0,'2018-08-26 09:42:29','涓€绾ч儴闂?),
(3,'瀛︿範閮?,'瀛︿範鐨?,0,'2018-08-26 09:59:16','涓€绾ч儴闂?),
(4,'鍙栨潗閮?,'鏉愭枡鏀跺彇',0,'2018-08-26 10:03:50','');

/*Table structure for table `t_leave` */

DROP TABLE IF EXISTS `t_leave`;

CREATE TABLE `t_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `reason` varchar(60) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `taskid` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_leave` */

insert  into `t_leave`(`id`,`uid`,`name`,`days`,`createtime`,`startdate`,`reason`,`flag`,`taskid`) values 
(1,2,'娴嬭瘯璇峰亣',5,'2018-08-24 21:33:06','2018-08-22','璇峰亣娴嬭瘯鍘熷洜',1,'11'),
(2,2,'娴嬭瘯璇峰亣2',6,'2018-08-24 21:44:41','2018-08-31','璇峰亣娴嬭瘯鍘熷洜22',0,'2507');

/*Table structure for table `t_leavelog` */

DROP TABLE IF EXISTS `t_leavelog`;

CREATE TABLE `t_leavelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `msg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_leavelog` */

insert  into `t_leavelog`(`id`,`uid`,`lid`,`type`,`createtime`,`msg`) values 
(1,2,NULL,0,'2018-08-24 21:33:06','鏂板璇峰亣璁板綍'),
(2,2,NULL,0,'2018-08-24 21:44:41','鏂板璇峰亣璁板綍'),
(3,2,1,1,'2018-08-26 10:17:11','鐢宠璇峰亣');

/*Table structure for table `t_resource` */

DROP TABLE IF EXISTS `t_resource`;

CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `per` varchar(100) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `t_resource` */

insert  into `t_resource`(`id`,`name`,`type`,`per`,`icon`,`parentid`) values 
(1,'鐢ㄦ埛绠＄悊',1,NULL,'layui-icon-user',-1),
(2,'瑙掕壊绠＄悊',1,NULL,'layui-icon-group',-1),
(3,'鏉冮檺绠＄悊',1,NULL,'layui-icon-util',-1),
(11,'鐢ㄦ埛鏂板',1,'useradd.html',NULL,1),
(12,'鐢ㄦ埛鍒楄〃',1,'userlist.html',NULL,1),
(21,'瑙掕壊娣诲姞',1,'roleadd.html',NULL,2),
(22,'瑙掕壊鍒楄〃',1,'rolelist.html',NULL,2),
(31,'鏉冮檺娣诲姞',1,'resourceadd.html',NULL,3),
(32,'鏉冮檺鍒楄〃',1,'resourcelist.html',NULL,3),
(33,'鐢ㄦ埛瑙掕壊缂栬緫',2,'uredit','',-1),
(34,'瑙掕壊鏉冮檺缂栬緫',2,'rredit','',-1),
(35,'鐢ㄦ埛淇℃伅缂栬緫',2,'uinfoedit','',-1),
(36,'瑙掕壊淇℃伅缂栬緫',2,'rinfoedit','',-1),
(37,'鏉冮檺淇℃伅缂栬緫',2,'resedit','',-1),
(38,'娴佺▼绠＄悊',1,'','layui-icon-form',-1),
(39,'鏂板娴佺▼',1,'leaveadd.html','',38),
(40,'娴佺▼鍒楄〃',1,'leavelist.html','',38),
(41,'寰呭姙浜嬮」',1,'leavewait.html','',38),
(42,'娴佺▼鏃ュ織',1,'leavelog.html','',38),
(43,'閮ㄩ棬绠＄悊',1,'','layui-icon-tree',-1),
(44,'閮ㄩ棬鏂板',1,'departmentadd.html','',43),
(45,'閮ㄩ棬鍒楄〃',1,'departmentlist.html','',43),
(46,'鐢ㄦ埛鎵€灞為儴闂ㄤ慨鏀?,2,'udedit','',-1);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `info` varchar(50) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`name`,`info`,`flag`) values 
(1,'root','绠＄悊鍛?,0),
(2,'manager','鎬荤洃',0),
(3,'group','涓荤',0),
(4,'staff','鍛樺伐',0),
(5,'clerk','绉樹功',1);

/*Table structure for table `t_roleresource` */

DROP TABLE IF EXISTS `t_roleresource`;

CREATE TABLE `t_roleresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `resid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `t_roleresource` */

insert  into `t_roleresource`(`id`,`rid`,`resid`) values 
(2,2,33),
(4,2,34),
(6,2,35),
(11,2,36),
(13,2,37),
(34,1,33),
(35,1,34),
(36,1,35),
(37,1,36),
(38,1,37),
(39,1,38),
(40,1,39),
(41,1,40),
(42,1,41),
(43,1,42),
(44,1,43),
(45,1,44),
(46,1,45),
(47,1,46);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`,`flag`) values 
(2,'admin','409ec7e03b14dd61e5729c2895316780',0),
(3,'jack','857c50dc714b3acf6d4022944e5326b4',0),
(4,'tom','857c50dc714b3acf6d4022944e5326b4',1),
(5,'jerry','857c50dc714b3acf6d4022944e5326b4',2),
(7,'rose','857c50dc714b3acf6d4022944e5326b4',2);

/*Table structure for table `t_userdepartment` */

DROP TABLE IF EXISTS `t_userdepartment`;

CREATE TABLE `t_userdepartment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_userdepartment` */

insert  into `t_userdepartment`(`id`,`uid`,`did`,`createtime`) values 
(1,2,1,'2018-08-25 16:18:12'),
(4,3,1,'2018-08-25 20:04:15'),
(5,4,3,'2018-08-26 09:59:28'),
(6,5,2,'2018-08-26 09:59:33'),
(7,7,2,'2018-08-26 09:59:37');

/*Table structure for table `t_userrole` */

DROP TABLE IF EXISTS `t_userrole`;

CREATE TABLE `t_userrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_userrole` */

insert  into `t_userrole`(`id`,`uid`,`rid`) values 
(2,3,2),
(7,2,1),
(8,4,4),
(9,5,4),
(10,7,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
