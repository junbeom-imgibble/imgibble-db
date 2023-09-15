/*
 Navicat Premium Data Transfer

 Source Server         : DockerMongo
 Source Server Type    : MongoDB
 Source Server Version : 40406
 Source Host           : localhost:27017
 Source Schema         : imgibble_unread_content

 Target Server Type    : MongoDB
 Target Server Version : 40406
 File Encoding         : 65001

 Date: 28/03/2023 11:31:35
*/


// ----------------------------
// Collection structure for unread_contents
// ----------------------------
db.getCollection("unread_contents").drop();
db.createCollection("unread_contents");
