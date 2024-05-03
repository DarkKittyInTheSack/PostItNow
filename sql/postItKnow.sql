USE PostDatabase

CREATE TABLE user(
    userId VARCHAR(20) PRIMARY KEY NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    images VARCHAR(100) NOT NULL,
    accountId VARCHAR(20) NOT NULL,
    descriptions VARCHAR(200)
);

CREATE TABLE account(
    accountId VARCHAR(20) PRIMARY KEY NOT NULL,
    username VARCHAR(20) NOT NULL UNIQUE,
    passwords VARCHAR(100) NOT NULL,
    roleId VARCHAR(20) NOT NULL,
    refreshToken VARCHAR(1000) NOT NULL
);

CREATE TABLE role(
    roleId VARCHAR(20) PRIMARY KEY NOT NULL,
    roleName VARCHAR(20) NOT NULL
);

CREATE TABLE address(
    addressId VARCHAR(20) PRIMARY KEY NOT NULL,
    street VARCHAR(100) NOT NULL,
    area VARCHAR(20) NOT NULL,
    states VARCHAR(20) NOT NULL,
    postCode INT NOT NULL
);

CREATE TABLE user_address(
    userAddressId VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    addressId VARCHAR(20) NOT NULL
);

CREATE TABLE chat_group(
    groupId VARCHAR(20) PRIMARY KEY NOT NULL,
    groupName VARCHAR(20) NOT NULL,
    groupDescription VARCHAR(30) NOT NULL
);

CREATE TABLE user_group(
    userGroupId VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    groupId VARCHAR(20) NOT NULL
);

CREATE TABLE notification(
    notificationId VARCHAR(20) PRIMARY KEY NOT NULL,
    notificationTitle VARCHAR(100) NOT NULL,
    notificationContent VARCHAR(100) NOT NULL,
    notificationDate DATETIME
);

CREATE TABLE user_notification(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    notificationId VARCHAR(20) NOT NULL
);

CREATE TABLE comment(
    commentId VARCHAR(20) PRIMARY KEY NOT NULL,
    commentDescription VARCHAR(200) NOT NULL,
    commentDate DATETIME NOT NULL
);

CREATE TABLE user_comment(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    commentId VARCHAR(20) NOT NULL
);

CREATE TABLE post_comment(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    postId VARCHAR(20) NOT NULL,
    commentId VARCHAR(20) NOT NULL
);

CREATE TABLE save_post(
    savePostId VARCHAR(20) PRIMARY KEY NOT NULL,
    savePostDate DATETIME NOT NULL
);

CREATE TABLE user_save_post(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    savePostId VARCHAR(20) NOT NULL
);

CREATE TABLE post_save_post(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    postId VARCHAR(20) NOT NULL,
    savePostId VARCHAR(20) NOT NULL
);

CREATE TABLE subscription(
    subscriptionId VARCHAR(20) PRIMARY KEY NOT NULL,
    subscriptionDate DATETIME NOT NULL
);

CREATE TABLE user_subscription(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    subscriptionId VARCHAR(20) NOT NULL,
    isNotification BIT NOT NULL
);

CREATE TABLE alert(
    alertId VARCHAR(20) PRIMARY KEY NOT NULL,
    alertTitle VARCHAR(50) NOT NULL,
    alertDescription VARCHAR(100) NOT NULL,
    alertDate DATETIME NOT NULL
);

CREATE TABLE user_alert(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    alertId VARCHAR(20) NOT NULL
);

CREATE TABLE post_alert(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    postId VARCHAR(20) NOT NULL,
    alertId VARCHAR(20) NOT NULL
);

CREATE TABLE ban(
    banId VARCHAR(20) PRIMARY KEY NOT NULL,
    banTitle VARCHAR(50) NOT NULL,
    banDescription VARCHAR(100) NOT NULL,
    banDate DATETIME NOT NULL
);

CREATE TABLE user_ban(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    banId VARCHAR(20) NOT NULL
);

CREATE TABLE post_ban(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    postId VARCHAR(20) NOT NULL,
    banId VARCHAR(20) NOT NULL
);

CREATE TABLE award (
    awardId VARCHAR(20) PRIMARY KEY NOT NULL,
    awardName VARCHAR(100) NOT NULL
);

CREATE TABLE user_award(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    awardId VARCHAR(20) NOT NULL
);

CREATE TABLE post_award(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    postId VARCHAR(20) NOT NULL,
    awardId VARCHAR(20) NOT NULL
);

CREATE TABLE interact(
    interactId VARCHAR(20) PRIMARY KEY NOT NULL,
    isLike BIT NOT NULL,
    isDislike BIT NOT NULL
);

CREATE TABLE user_interact(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    interactId VARCHAR(20) NOT NULL
);

CREATE TABLE post_interact(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    postId VARCHAR(20) NOT NULL,
    interactId VARCHAR(20) NOT NULL
);

CREATE TABLE post(
    postId VARCHAR(20) PRIMARY KEY NOT NULL,
    postTitle VARCHAR(50) NOT NULL,
    postDescription VARCHAR(500) NOT NULL,
    postUpdateDate DATETIME NOT NULL
);

CREATE TABLE user_post(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    postId VARCHAR(20) NOT NULL
);

CREATE TABLE type (
    typeId VARCHAR(20) PRIMARY KEY NOT NULL,
    typeName VARCHAR(100) NOT NULL
);

CREATE TABLE post_type(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    typeId VARCHAR(20) NOT NULL,
    postId VARCHAR(20) NOT NULL
);

CREATE TABLE attachment(
    attachmentId VARCHAR(20) PRIMARY KEY NOT NULL,
    attachmentUrl VARCHAR(100) NOT NULL,
    isSaved BIT NOT NULL
);

CREATE TABLE save_attachment(
    saveAttachmentId VARCHAR(20) PRIMARY KEY NOT NULL,
    saveAttachmentDate DATETIME NOT NULL,
    attachmentId VARCHAR(20) NOT NULL
);

CREATE TABLE user_save_attachment(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    saveAttachmentId VARCHAR(20) NOT NULL
);

CREATE TABLE post_attachment(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    postId VARCHAR(20) NOT NULL,
    attachmentId VARCHAR(20) NOT NULL
);
CREATE TABLE user_attachment(
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    userId VARCHAR(20) NOT NULL,
    attachmentId VARCHAR(20) NOT NULL
);

ALTER TABLE user ADD CONSTRAINT fk_user_account_id FOREIGN KEY ( accountId ) REFERENCES account( accountId ) ON DELETE CASCADE;
ALTER TABLE account ADD CONSTRAINT fk_account_role_id FOREIGN KEY ( roleId ) REFERENCES role( roleId ) ON DELETE CASCADE;
ALTER TABLE user_address ADD CONSTRAINT fk_user_address_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_address ADD CONSTRAINT fk_user_address_address_id FOREIGN KEY ( addressId ) REFERENCES address( addressId ) ON DELETE CASCADE;
ALTER TABLE user_group ADD CONSTRAINT fk_user_group_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_group ADD CONSTRAINT fk_user_group_group_id FOREIGN KEY ( groupId ) REFERENCES chat_group( groupId ) ON DELETE CASCADE;
ALTER TABLE user_notification ADD CONSTRAINT fk_user_notification_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_notification ADD CONSTRAINT fk_user_notification_notification_id FOREIGN KEY ( notificationId ) REFERENCES notification( notificationId ) ON DELETE CASCADE;
ALTER TABLE user_comment ADD CONSTRAINT fk_user_comment_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_comment ADD CONSTRAINT fk_user_comment_comment_id FOREIGN KEY ( commentId ) REFERENCES comment( commentId ) ON DELETE CASCADE;
ALTER TABLE post_comment ADD CONSTRAINT fk_post_comment_post_id FOREIGN KEY ( postId ) REFERENCES post( postId ) ON DELETE CASCADE;
ALTER TABLE post_comment ADD CONSTRAINT fk_post_comment_comment_id FOREIGN KEY ( commentId ) REFERENCES comment( commentId ) ON DELETE CASCADE;
ALTER TABLE user_save_post ADD CONSTRAINT fk_user_save_post_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_save_post ADD CONSTRAINT fk_user_save_post_save_post_id FOREIGN KEY ( savePostId ) REFERENCES save_post( savePostId ) ON DELETE CASCADE;
ALTER TABLE post_save_post ADD CONSTRAINT fk_post_save_post_post_id FOREIGN KEY ( postId ) REFERENCES post( postId ) ON DELETE CASCADE;
ALTER TABLE post_save_post ADD CONSTRAINT fk_post_save_post_save_post_id FOREIGN KEY ( savePostId ) REFERENCES save_post( savePostId ) ON DELETE CASCADE;
ALTER TABLE user_subscription ADD CONSTRAINT fk_user_subscription_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_subscription ADD CONSTRAINT fk_user_subscription_subscription_id FOREIGN KEY ( subscriptionId ) REFERENCES subscription( subscriptionId ) ON DELETE CASCADE;
ALTER TABLE user_alert ADD CONSTRAINT fk_user_alert_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_alert ADD CONSTRAINT fk_user_alert_alert_id FOREIGN KEY ( alertId ) REFERENCES alert( alertId ) ON DELETE CASCADE;
ALTER TABLE post_alert ADD CONSTRAINT fk_post_alert_post_id FOREIGN KEY ( postId ) REFERENCES post( postId ) ON DELETE CASCADE;
ALTER TABLE post_alert ADD CONSTRAINT fk_post_alert_alert_id FOREIGN KEY ( alertId ) REFERENCES alert( alertId ) ON DELETE CASCADE;
ALTER TABLE user_ban ADD CONSTRAINT fk_user_ban_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_ban ADD CONSTRAINT fk_user_ban_ban_id FOREIGN KEY ( banId ) REFERENCES ban( banId ) ON DELETE CASCADE;
ALTER TABLE post_ban ADD CONSTRAINT fk_post_ban_post_id FOREIGN KEY ( postId ) REFERENCES post( postId ) ON DELETE CASCADE;
ALTER TABLE post_ban ADD CONSTRAINT fk_post_ban_ban_id FOREIGN KEY ( banId ) REFERENCES ban( banId ) ON DELETE CASCADE;
ALTER TABLE user_award ADD CONSTRAINT fk_user_award_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_award ADD CONSTRAINT fk_user_award_award_id FOREIGN KEY ( awardId ) REFERENCES award( awardId ) ON DELETE CASCADE;
ALTER TABLE post_award ADD CONSTRAINT fk_post_award_post_id FOREIGN KEY ( postId ) REFERENCES post( postId ) ON DELETE CASCADE;
ALTER TABLE post_award ADD CONSTRAINT fk_post_award_award_id FOREIGN KEY ( awardId ) REFERENCES award( awardId ) ON DELETE CASCADE;
ALTER TABLE user_interact ADD CONSTRAINT fk_user_interact_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_interact ADD CONSTRAINT fk_user_interact_interact_id FOREIGN KEY ( interactId ) REFERENCES interact( interactId ) ON DELETE CASCADE;
ALTER TABLE post_interact ADD CONSTRAINT fk_post_interact_post_id FOREIGN KEY ( postId ) REFERENCES post( postId ) ON DELETE CASCADE;
ALTER TABLE post_interact ADD CONSTRAINT fk_post_interact_interact_id FOREIGN KEY ( interactId ) REFERENCES interact( interactId ) ON DELETE CASCADE;
ALTER TABLE post_type ADD CONSTRAINT fk_post_type_post_id FOREIGN KEY ( postId ) REFERENCES post( postId ) ON DELETE CASCADE;
ALTER TABLE post_type ADD CONSTRAINT fk_post_type_type_id FOREIGN KEY ( typeId ) REFERENCES type( typeId ) ON DELETE CASCADE;
ALTER TABLE save_attachment ADD CONSTRAINT fk_save_attachment_attachment_id FOREIGN KEY ( attachmentId ) REFERENCES attachment( attachmentId ) ON DELETE CASCADE;
ALTER TABLE user_save_attachment ADD CONSTRAINT fk_user_save_attachment_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_save_attachment ADD CONSTRAINT fk_user_save_attachment_save_attachment_id FOREIGN KEY ( saveAttachmentId ) REFERENCES save_attachment( saveAttachmentId ) ON DELETE CASCADE;
ALTER TABLE post_attachment ADD CONSTRAINT fk_post_attachment_user_id FOREIGN KEY ( postId ) REFERENCES post( postId ) ON DELETE CASCADE;
ALTER TABLE post_attachment ADD CONSTRAINT fk_post_attachment_attachment_id FOREIGN KEY ( attachmentId ) REFERENCES attachment( attachmentId ) ON DELETE CASCADE;
ALTER TABLE user_attachment ADD CONSTRAINT fk_user_attachment_user_id FOREIGN KEY ( userId ) REFERENCES user( userId ) ON DELETE CASCADE;
ALTER TABLE user_attachment ADD CONSTRAINT fk_user_attachment_attachment_id FOREIGN KEY ( attachmentId ) REFERENCES attachment( attachmentId ) ON DELETE CASCADE;