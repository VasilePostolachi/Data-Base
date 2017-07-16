CREATE TABLE `event` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Numarul de ordine a evenimentului',
`start_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Momentul inceperii evenimentului',
`duration_in_minutes` smallint NULL,
`subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Denumirea Evenimentului',
`importance-id` int(1) NULL COMMENT 'Numarul de ordine a importantei',
`creation_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
`last_modification_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
`end_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
`calendar-id` int(11) NOT NULL COMMENT 'Numarul de ordine a calendarului',
`body` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Descrierea evenimentului',
`location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Locul intalnirii',
`timezone-id` int(5) NOT NULL COMMENT 'Numarul de ordine a zonei',
`busy_status-id` int(11) NOT NULL COMMENT 'Numarul de ordine a statusului de activitate',
`sensitivity-id` int(11) NOT NULL COMMENT 'Numarul de ordine a statusului',
`meeting_status-id` int(2) NULL COMMENT 'Nr de ordine a meeting_status',
`recuring` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Repetarea evenimentului',
`optional_attendees` varchar(255) NULL COMMENT 'Nr de ordine a \'attendantei\'',
`required_attendees` varchar(255) NULL,
`response_requested` bit(1) NULL DEFAULT 0 COMMENT 'Raspunsul Solicitat',
`response_status` int(2) NOT NULL COMMENT 'Nr de ordine a raspunsului',
`atachments` bit(1) NOT NULL DEFAULT 0 COMMENT 'Atasari de fisiere',
`milleage` decimal(10,2) NULL COMMENT 'Distanta parcursa dintre doua puncte',
`meeting_workspace_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Adresa site-lui de lucru',
`unread` bit(1) NOT NULL DEFAULT 0 COMMENT 'Mesajul este citit sau necitit',
`Entry_ID` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '?',
`internet_codepage` int(11) NOT NULL COMMENT 'Codul paginii de retea',
`reply_time` date NULL COMMENT 'Timpul de repetare',
`no_aging` bit(1) NULL DEFAULT 0 COMMENT 'Statusul de imbatranire',
`event_resources` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Resursele',
`reminder_minutes_before_start` int(11) NULL COMMENT 'Timpul de reamintire inainte de incepere(minute)',
`reminder_override_default` bit(1) NULL DEFAULT 0 COMMENT 'Moment de reamintire implicita',
`reminder_set` bit(1) NULL DEFAULT 0 COMMENT 'Reamintirea evenimentului',
`outlook_version` int(5) NOT NULL COMMENT 'Versiunea outlook',
`outlook_internal_version` int(5) NOT NULL COMMENT 'Versiunea interioara a outlook',
`saved` bit(1) NOT NULL DEFAULT 0 COMMENT 'Salvat sau nesalvat',
`size` int(11) NULL COMMENT 'Marimea documentului',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TRIGGER `delete_category` After DELETE ON `event` FOR EACH ROW BEGIN
  DELETE FROM `event_category` WHERE OLD.id=`event-id`;
END;

CREATE TABLE `calendar` (
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Numarul de ordine',
`calendar_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Numele calendarului',
`calendar_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Tipul calendarului',
`calendar_user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Numele stapanului calendarului',
`calendar_refender` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Stapanul calendarului',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TRIGGER `delete_calendar` Before DELETE ON `calendar` FOR EACH ROW BEGIN
  DELETE FROM `event` WHERE OLD.id=`calendar-id`;
END;
CREATE TRIGGER `delete_calendar_category` After DELETE ON `calendar` FOR EACH ROW BEGIN
  DELETE FROM `calendar_category` WHERE OLD.id=`calendar-id`;
END;

CREATE TABLE `time_zone` (
`id` int(5) NOT NULL AUTO_INCREMENT,
`time_zone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Orasele din zona anumita',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE `sensitivity` (
`id` int(2) NOT NULL AUTO_INCREMENT,
`name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Denumirea statusului',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE `event_category` (
`event-id` int(11) NOT NULL COMMENT 'Numarul de ordine a evenimentului',
`category-id` int(11) NOT NULL COMMENT 'Nr de ordine a statusului categoriei'
);

CREATE TABLE `category` (
`id` int(2) NOT NULL AUTO_INCREMENT,
`name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Numele categoriei',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TRIGGER `category-event_delete` After DELETE ON `category` FOR EACH ROW BEGIN
  DELETE FROM `event_category` WHERE OLD.id=`category-id`;
END;

CREATE TABLE `importance` (
`id` int(1) NOT NULL AUTO_INCREMENT COMMENT 'Numarul de ordine',
`name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Nivelul de importanta',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE `busy_status` (
`id` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Numarul de ordine',
`work_status_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Statusul de lucru',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE `meeting_status` (
`id` int(2) NOT NULL AUTO_INCREMENT,
`status_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Denumirea statusului',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE `response_status` (
`respons_id` int(2) NOT NULL AUTO_INCREMENT,
`response_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Denumirea raspunsului',
PRIMARY KEY (`respons_id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE `outlook_version` (
`id` int(5) NOT NULL AUTO_INCREMENT,
`version_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Versiunea de outlook',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE `outlook_internal_version` (
`id` int(5) NOT NULL AUTO_INCREMENT,
`version_name2` int(11) NOT NULL COMMENT 'Denumirea versiunii',
PRIMARY KEY (`id`) 
);

CREATE TABLE `calendar_category` (
`calendar-id` int(11) NOT NULL COMMENT 'Id-ul calendarului',
`category-id` int(2) NOT NULL COMMENT 'Id-ul categoriei'
);

CREATE TABLE `export_time` (
`id` bigint NOT NULL AUTO_INCREMENT,
`export_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data si ora exportarii',
PRIMARY KEY (`id`) 
);

CREATE TABLE `calendar-export_time` (
`calendar-id` int(11) NOT NULL COMMENT 'Id-ul calendarului',
`export_time-id` bigint NOT NULL COMMENT 'Ora la care a fost exportat'
);


ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_calendar_1` FOREIGN KEY (`calendar-id`) REFERENCES `calendar` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_time_zone_1` FOREIGN KEY (`timezone-id`) REFERENCES `time_zone` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_sensitivity_1` FOREIGN KEY (`sensitivity-id`) REFERENCES `sensitivity` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_importance_1` FOREIGN KEY (`importance-id`) REFERENCES `importance` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_show_as_1` FOREIGN KEY (`busy_status-id`) REFERENCES `busy_status` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_meeting_status_1` FOREIGN KEY (`meeting_status-id`) REFERENCES `meeting_status` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_response_status_1` FOREIGN KEY (`response_status`) REFERENCES `response_status` (`respons_id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_outlook_versin_1` FOREIGN KEY (`outlook_version`) REFERENCES `outlook_version` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_out_look_internal_ver_1` FOREIGN KEY (`outlook_internal_version`) REFERENCES `outlook_internal_version` (`id`);
ALTER TABLE `event_category` ADD CONSTRAINT `fk_event_category_eveniment_1` FOREIGN KEY (`event-id`) REFERENCES `event` (`id`);
ALTER TABLE `event_category` ADD CONSTRAINT `fk_event_category_category_1` FOREIGN KEY (`category-id`) REFERENCES `category` (`id`);
ALTER TABLE `calendar_category` ADD CONSTRAINT `fk_calendar_category_calendar_1` FOREIGN KEY (`calendar-id`) REFERENCES `calendar` (`id`);
ALTER TABLE `calendar_category` ADD CONSTRAINT `fk_calendar_category_category_1` FOREIGN KEY (`category-id`) REFERENCES `category` (`id`);
ALTER TABLE `calendar-export_time` ADD CONSTRAINT `fk_calendar-export_time_calendar_1` FOREIGN KEY (`calendar-id`) REFERENCES `calendar` (`id`);
ALTER TABLE `calendar-export_time` ADD CONSTRAINT `fk_calendar-export_time_export_time_1` FOREIGN KEY (`export_time-id`) REFERENCES `export_time` (`id`);

CREATE 
VIEW `all_info` AS 
SELECT c.calendar_name,c.calendar_type,c.calendar_user_name,c.calendar_refender,e.id,e.start_time,e.duration_in_minutes,
e.subject,i.name importance_name,e.creation_time,e.last_modification_time,e.end_time,e.body,e.location,tm.time_zone,b.work_status_name,
s.name sensitivity_name,m.status_name,e.recuring,e.optional_attendees,e.required_attendees,e.response_requested,r.response_name,
e.atachments,e.milleage,e.meeting_workspace_url,e.unread,e.Entry_Id,e.internet_codepage,e.reply_time,e.no_aging,
e.event_resources,e.reminder_minutes_before_start,e.reminder_override_default,e.reminder_set,ov.version_name,
ovi.version_name2,e.saved,e.size
FROM
calendar AS c
INNER JOIN `event` AS e ON e.`calendar-id` = c.id
INNER JOIN importance AS i ON e.`importance-id` = i.id 
INNER JOIN time_zone AS tm ON e.`timezone-id` = tm.id 
INNER JOIN busy_status AS b ON e.`busy_status-id` = b.id 
INNER JOIN sensitivity AS s ON e.`sensitivity-id` = s.id 
INNER JOIN meeting_status AS m ON e.`meeting_status-id` = m.id 
INNER JOIN response_status AS r ON e.response_status = r.respons_id 
INNER JOIN outlook_version AS ov ON ov.id = e.outlook_version 
INNER JOIN outlook_internal_version AS ovi ON ovi.id = e.outlook_internal_version
ORDER BY c.calendar_name,e.id;

CREATE 
VIEW `calendar_export_time` AS 
SELECT c.*,et.export_time FROM
calendar c INNER JOIN `calendar-export_time` cet ON cet.`calendar-id`=c.id
INNER JOIN export_time et ON cet.`export_time-id`=et.id;

