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
`body` longblob NULL COMMENT 'Descrierea evenimentului',
`location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Locul intalnirii',
`timezone-id` int(5) NOT NULL COMMENT 'Numarul de ordine a zonei',
`busy_status-id` int(11) NOT NULL COMMENT 'Numarul de ordine a statusului de activitate',
`sensitivity-id` int(11) NOT NULL COMMENT 'Numarul de ordine a statusului',
`meeting_status-id` int(2) NULL COMMENT 'Nr de ordine a meeting_status',
`recuring` int(11) NULL COMMENT 'Repetarea evenimentului',
`optional_attendees` text NULL COMMENT 'Nr de ordine a \'attendantei\'',
`required_attendees` text NULL,
`response_requested-id` int(1) NULL DEFAULT 1 COMMENT 'Raspunsul Solicitat',
`response_status` int(2) NOT NULL COMMENT 'Nr de ordine a raspunsului',
`atachments` int(1) NOT NULL DEFAULT 1 COMMENT 'Atasari de fisiere',
`milleage` decimal(10,2) NULL COMMENT 'Distanta parcursa dintre doua puncte',
`meeting_workspace_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Adresa site-lui de lucru',
`unread` int(1) NOT NULL DEFAULT 1 COMMENT 'Mesajul este citit sau necitit',
`Entry_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '?',
`internet_codepage` int(11) NOT NULL COMMENT 'Codul paginii de retea',
`reply_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timpul de repetare',
`no_aging` int(1) NULL COMMENT 'Statusul de imbatranire',
`event_resources` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Resursele',
`reminder_minutes_before_start` int(11) NULL COMMENT 'Timpul de reamintire inainte de incepere(minute)',
`reminder_override_default` int(1) NULL COMMENT 'Moment de reamintire implicita',
`reminder_set` int(1) NULL DEFAULT 1 COMMENT 'Reamintirea evenimentului',
`outlook_version` int(5) NOT NULL COMMENT 'Versiunea outlook',
`outlook_internal_version` int(5) NOT NULL COMMENT 'Versiunea interioara a outlook',
`saved` int(1) NOT NULL DEFAULT 1 COMMENT 'Salvat sau nesalvat',
`size` int(11) NULL COMMENT 'Marimea documentului',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

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

CREATE TABLE `time_zone` (
`id` int(5) NOT NULL AUTO_INCREMENT,
`time` time NOT NULL COMMENT 'Timpul dintr-o zona anumita ',
`zone` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Orasele din zona anumita',
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
`name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Numele categoriei',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

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
`status_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Denumirea statusului',
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

CREATE TABLE `boolean_responce` (
`id` int(1) NOT NULL AUTO_INCREMENT,
`responce` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Raspuns de tip (Yes/No)',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE `outlook_version` (
`id` int(5) NOT NULL AUTO_INCREMENT,
`version_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Versiunea de outlook',
PRIMARY KEY (`id`) 
)
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE `outlook_internal_version` (
`id` int(5) NOT NULL AUTO_INCREMENT,
`version_name` int(11) NOT NULL COMMENT 'Denumirea versiunii',
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
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_boolean_responce_1` FOREIGN KEY (`atachments`) REFERENCES `boolean_responce` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_boolean_responce_2` FOREIGN KEY (`unread`) REFERENCES `boolean_responce` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_boolean_responce_3` FOREIGN KEY (`reminder_set`) REFERENCES `boolean_responce` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_boolean_responce_4` FOREIGN KEY (`response_requested-id`) REFERENCES `boolean_responce` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_boolean_responce_5` FOREIGN KEY (`no_aging`) REFERENCES `boolean_responce` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_boolean_responce_6` FOREIGN KEY (`saved`) REFERENCES `boolean_responce` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_boolean_responce_7` FOREIGN KEY (`reminder_override_default`) REFERENCES `boolean_responce` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_outlook_versin_1` FOREIGN KEY (`outlook_version`) REFERENCES `outlook_version` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_out_look_internal_ver_1` FOREIGN KEY (`outlook_internal_version`) REFERENCES `outlook_internal_version` (`id`);
ALTER TABLE `event` ADD CONSTRAINT `fk_eveniment_boolean_responce_8` FOREIGN KEY (`recuring`) REFERENCES `boolean_responce` (`id`);
ALTER TABLE `event_category` ADD CONSTRAINT `fk_event_category_eveniment_1` FOREIGN KEY (`event-id`) REFERENCES `event` (`id`);
ALTER TABLE `event_category` ADD CONSTRAINT `fk_event_category_category_1` FOREIGN KEY (`category-id`) REFERENCES `category` (`id`);
ALTER TABLE `calendar_category` ADD CONSTRAINT `fk_calendar_category_calendar_1` FOREIGN KEY (`calendar-id`) REFERENCES `calendar` (`id`);
ALTER TABLE `calendar_category` ADD CONSTRAINT `fk_calendar_category_category_1` FOREIGN KEY (`category-id`) REFERENCES `category` (`id`);
ALTER TABLE `calendar-export_time` ADD CONSTRAINT `fk_calendar-export_time_calendar_1` FOREIGN KEY (`calendar-id`) REFERENCES `calendar` (`id`);
ALTER TABLE `calendar-export_time` ADD CONSTRAINT `fk_calendar-export_time_export_time_1` FOREIGN KEY (`export_time-id`) REFERENCES `export_time` (`id`);

