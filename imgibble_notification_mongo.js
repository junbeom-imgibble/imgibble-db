/*
 Navicat Premium Data Transfer

 Source Server         : DockerMongo
 Source Server Type    : MongoDB
 Source Server Version : 40406
 Source Host           : localhost:27017
 Source Schema         : imgibble_notification

 Target Server Type    : MongoDB
 Target Server Version : 40406
 File Encoding         : 65001

 Date: 28/03/2023 11:31:27
*/


// ----------------------------
// Collection structure for email_notifications
// ----------------------------
db.getCollection("email_notifications").drop();
db.createCollection("email_notifications");

// ----------------------------
// Collection structure for notifications
// ----------------------------
db.getCollection("notifications").drop();
db.createCollection("notifications");
