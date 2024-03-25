USE PostDatabase

CREATE TABLE user(
    user_id VARCHAR(20) PRIMARY KEY NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    images VARCHAR(100) NOT NULL,
    account_id VARCHAR(20) NOT NULL,
    descriptions VARCHAR(200)
);

CREATE TABLE account(
    account_id VARCHAR(20) PRIMARY KEY NOT NULL,
    username VARCHAR(20) NOT NULL,
    passwords VARCHAR(100) NOT NULL,
    role_id VARCHAR(20) NOT NULL
);

CREATE TABLE role(
    role_id VARCHAR(20) PRIMARY KEY NOT NULL,
    role_name VARCHAR(20) NOT NULL
);

CREATE TABLE address(
    address_id VARCHAR(20) PRIMARY KEY NOT NULL,
    street VARCHAR(100) NOT NULL,
    area VARCHAR(20) NOT NULL,
    states VARCHAR(20) NOT NULL,
    post_code INT NOT NULL
);

CREATE TABLE user_address(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    address_id VARCHAR(20) NOT NULL,
);

CREATE TABLE group(
    group_id VARCHAR(20) PRIMARY KEY NOT NULL,
    group_name VARCHAR(100) NOT NULL
);

CREATE TABLE user_group(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    group_id VARCHAR(20) NOT NULL,
);

CREATE TABLE notification(
    notification_id VARCHAR(20) PRIMARY KEY NOT NULL,
    notification_content VARCHAR(100) NOT NULL,
    notification_date DATETIME
);

CREATE TABLE user_notification(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    notification_id VARCHAR(20) NOT NULL,
);

CREATE TABLE comment(
    comment_id VARCHAR(20) PRIMARY KEY NOT NULL,
    comment_description VARCHAR(200) NOT NULL,
    comment_date DATETIME NOT NULL,
);

CREATE TABLE user_comment(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    comment_id VARCHAR(20) NOT NULL,
);

CREATE TABLE post_comment(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    post_id VARCHAR(20) NOT NULL,
    notification_id VARCHAR(20) NOT NULL,
);

CREATE TABLE save_post(
    save_post_id VARCHAR(20) PRIMARY KEY NOT NULL,
    save_post_date DATETIME NOT NULL,
);

CREATE TABLE user_save_post(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    save_post_id VARCHAR(20) NOT NULL,
);

CREATE TABLE post_save_post(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    post_id VARCHAR(20) NOT NULL,
    save_post_id VARCHAR(20) NOT NULL,
);

CREATE TABLE subscription(
    subscription_id VARCHAR(20) PRIMARY KEY NOT NULL,
    subscription_date DATETIME NOT NULL,
);

CREATE TABLE user_subscription(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    subscription_id VARCHAR(20) NOT NULL,
    is_notification BIT NOT NULL,
);

CREATE TABLE alert(
    alert_id VARCHAR(20) PRIMARY KEY NOT NULL,
    alert_title VARCHAR(50) NOT NULL,
    alert_description VARCHAR(100) NOT NULL,
    alert_date DATETIME NOT NULL,
);

CREATE TABLE user_alert(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    alert_id VARCHAR(20) NOT NULL,
);

CREATE TABLE post_alert(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    post_id VARCHAR(20) NOT NULL,
    alert_id VARCHAR(20) NOT NULL,
);

CREATE TABLE ban(
    ban_id VARCHAR(20) PRIMARY KEY NOT NULL,
    ban_title VARCHAR(50) NOT NULL,
    ban_description VARCHAR(100) NOT NULL,
    ban_date DATETIME NOT NULL,
);

CREATE TABLE user_ban(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    ban_id VARCHAR(20) NOT NULL,
);

CREATE TABLE post_ban(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    post_id VARCHAR(20) NOT NULL,
    ban_id VARCHAR(20) NOT NULL,
);

CREATE TABLE award (
    award_id VARCHAR(20) PRIMARY KEY NOT NULL,
    award_name VARCHAR(100) NOT NULL,
);

CREATE TABLE user_award(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    award_id VARCHAR(20) NOT NULL,
);

CREATE TABLE post_award(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    post_id VARCHAR(20) NOT NULL,
    award_id VARCHAR(20) NOT NULL,
);

CREATE TABLE interact(
    interact_id VARCHAR(20) PRIMARY KEY NOT NULL,
    is_like BIT NOT NULL,
    is_dislike BIT NOT NULL,
);

CREATE TABLE user_interact(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    interact_id VARCHAR(20) NOT NULL,
);

CREATE TABLE post_interact(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    post_id VARCHAR(20) NOT NULL,
    interact_id VARCHAR(20) NOT NULL,
);

CREATE TABLE post(
    post_id VARCHAR(20) PRIMARY KEY NOT NULL,
    post_title VARCHAR(50) NOT NULL,
    post_description VARCHAR(500) NOT NULL,
    post_update_date DATETIME NOT NULL
);

CREATE TABLE user_post(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    post_id VARCHAR(20) NOT NULL,
);

CREATE TABLE type (
    type_id VARCHAR(20) PRIMARY KEY NOT NULL,
    type_name VARCHAR(100) NOT NULL,
);

CREATE TABLE post_type(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    type_id VARCHAR(20) NOT NULL,
    post_id VARCHAR(20) NOT NULL,
);

CREATE TABLE attachment(
    attachment_id VARCHAR(20) PRIMARY KEY NOT NULL,
    attachment_url VARCHAR(100) NOT NULL,
    is_saved BIT NOT NULL,
);

CREATE TABLE save_attachment(
    save_attachment_id VARCHAR(20) PRIMARY KEY NOT NULL,
    save_attachment_date DATETIME NOT NULL,
    attachment_id VARCHAR(20) NOT NULL,
);

CREATE TABLE user_save_attachment(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    save_attachment_id VARCHAR(20) NOT NULL,
);

ALTER TABLE user ADD CONSTRAINT fk_user_account_id FOREIGN KEY ( account_id ) REFERENCES account( account_id );
ALTER TABLE account ADD CONSTRAINT fk_account_role_id FOREIGN KEY ( role_id ) REFERENCES role( role_id );
ALTER TABLE user_address ADD CONSTRAINT fk_user_address_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_address ADD CONSTRAINT fk_user_address_address_id FOREIGN KEY ( address_id ) REFERENCES address( address_id );
ALTER TABLE user_group ADD CONSTRAINT fk_user_group_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_group ADD CONSTRAINT fk_user_group_group_id FOREIGN KEY ( group_id ) REFERENCES group( group_id );
ALTER TABLE user_notification ADD CONSTRAINT fk_user_notification_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_notification ADD CONSTRAINT fk_user_notification_notification_id FOREIGN KEY ( notification_id ) REFERENCES notification( notification_id );
ALTER TABLE user_comment ADD CONSTRAINT fk_user_comment_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_comment ADD CONSTRAINT fk_user_comment_comment_id FOREIGN KEY ( comment_id ) REFERENCES comment( comment_id );
ALTER TABLE post_comment ADD CONSTRAINT fk_post_comment_post_id FOREIGN KEY ( post_id ) REFERENCES post( post_id );
ALTER TABLE post_comment ADD CONSTRAINT fk_post_comment_comment_id FOREIGN KEY ( comment_id ) REFERENCES comment( comment_id );
ALTER TABLE user_save_post ADD CONSTRAINT fk_user_save_post_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_save_post ADD CONSTRAINT fk_user_save_post_save_post_id FOREIGN KEY ( save_post_id ) REFERENCES save_post( save_post_id );
ALTER TABLE post_save_post ADD CONSTRAINT fk_post_save_post_post_id FOREIGN KEY ( post_id ) REFERENCES post( post_id );
ALTER TABLE post_save_post ADD CONSTRAINT fk_post_save_post_save_post_id FOREIGN KEY ( save_post_id ) REFERENCES save_post( save_post_id );
ALTER TABLE user_subscription ADD CONSTRAINT fk_user_subscription_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_subscription ADD CONSTRAINT fk_user_subscription_subscription_id FOREIGN KEY ( subscription_id ) REFERENCES subscription( subscription_id );
ALTER TABLE user_alert ADD CONSTRAINT fk_user_alert_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_alert ADD CONSTRAINT fk_user_alert_alert_id FOREIGN KEY ( alert_id ) REFERENCES alert( alert_id );
ALTER TABLE post_alert ADD CONSTRAINT fk_post_alert_post_id FOREIGN KEY ( post_id ) REFERENCES post( post_id );
ALTER TABLE post_alert ADD CONSTRAINT fk_post_alert_alert_id FOREIGN KEY ( alert_id ) REFERENCES alert( alert_id );
ALTER TABLE user_ban ADD CONSTRAINT fk_user_ban_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_ban ADD CONSTRAINT fk_user_ban_ban_id FOREIGN KEY ( ban_id ) REFERENCES ban( ban_id );
ALTER TABLE post_ban ADD CONSTRAINT fk_post_ban_post_id FOREIGN KEY ( post_id ) REFERENCES post( post_id );
ALTER TABLE post_ban ADD CONSTRAINT fk_post_ban_ban_id FOREIGN KEY ( ban_id ) REFERENCES ban( ban_id );
ALTER TABLE user_award ADD CONSTRAINT fk_user_award_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_award ADD CONSTRAINT fk_user_award_award_id FOREIGN KEY ( award_id ) REFERENCES award( award_id );
ALTER TABLE post_award ADD CONSTRAINT fk_post_award_post_id FOREIGN KEY ( post_id ) REFERENCES post( post_id );
ALTER TABLE post_award ADD CONSTRAINT fk_post_award_award_id FOREIGN KEY ( award_id ) REFERENCES award( award_id );
ALTER TABLE user_interact ADD CONSTRAINT fk_user_interact_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_interact ADD CONSTRAINT fk_user_interact_interact_id FOREIGN KEY ( interact_id ) REFERENCES interact( interact_id );
ALTER TABLE post_interact ADD CONSTRAINT fk_post_interact_post_id FOREIGN KEY ( post_id ) REFERENCES post( post_id );
ALTER TABLE post_interact ADD CONSTRAINT fk_post_interact_interact_id FOREIGN KEY ( interact_id ) REFERENCES interact( interact_id );
ALTER TABLE post_type ADD CONSTRAINT fk_post_type_post_id FOREIGN KEY ( post_id ) REFERENCES post( post_id );
ALTER TABLE post_type ADD CONSTRAINT fk_post_type_type_id FOREIGN KEY ( type_id ) REFERENCES type( type_id );
ALTER TABLE save_attachment ADD CONSTRAINT fk_save_attachment_attachment_id FOREIGN KEY ( attachment_id ) REFERENCES attachment( attachment_id );
ALTER TABLE user_save_attachment ADD CONSTRAINT fk_user_save_attachment_user_id FOREIGN KEY ( user_id ) REFERENCES user( user_id );
ALTER TABLE user_save_attachment ADD CONSTRAINT fk_user_save_attachment_save_attachment_id FOREIGN KEY ( save_attachment_id ) REFERENCES save_attachment( save_attachment_id );