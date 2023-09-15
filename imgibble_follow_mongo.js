/*
 Navicat Premium Data Transfer

 Source Server         : DockerMongo
 Source Server Type    : MongoDB
 Source Server Version : 40406
 Source Host           : localhost:27017
 Source Schema         : imgibble_follow

 Target Server Type    : MongoDB
 Target Server Version : 40406
 File Encoding         : 65001

 Date: 28/03/2023 11:31:15
*/


// ----------------------------
// Collection structure for followers
// ----------------------------
db.getCollection("followers").drop();
db.createCollection("followers");
