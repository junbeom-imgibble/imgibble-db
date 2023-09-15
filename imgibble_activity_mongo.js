/*
 Navicat Premium Data Transfer

 Source Server         : DockerMongo
 Source Server Type    : MongoDB
 Source Server Version : 40406
 Source Host           : localhost:27017
 Source Schema         : imgibble_activity

 Target Server Type    : MongoDB
 Target Server Version : 40406
 File Encoding         : 65001

 Date: 28/03/2023 11:30:52
*/


// ----------------------------
// Collection structure for activities
// ----------------------------
db.getCollection("activities").drop();
db.createCollection("activities");
db.getCollection("activities").createIndex({
    type: NumberInt("1")
}, {
    name: "activities-idx-type"
});
db.getCollection("activities").createIndex({
    workspaceId: NumberInt("1")
}, {
    name: "activities-idx-workspaceId"
});
db.getCollection("activities").createIndex({
    channelId: NumberInt("1")
}, {
    name: "activities-idx-channelId"
});
db.getCollection("activities").createIndex({
    assetId: NumberInt("1")
}, {
    name: "activities-idx-assetId"
});
db.getCollection("activities").createIndex({
    authorId: NumberInt("1")
}, {
    name: "activities-idx-authorId"
});
db.getCollection("activities").createIndex({
    createdAt: NumberInt("1")
}, {
    name: "activities-idx-createdAt"
});

// ----------------------------
// Collection structure for notifications
// ----------------------------
db.getCollection("notifications").drop();
db.createCollection("notifications");
db.getCollection("notifications").createIndex({
    workspaceId: NumberInt("1")
}, {
    name: "notifications-idx-workspaceId"
});
db.getCollection("notifications").createIndex({
    channelId: NumberInt("1")
}, {
    name: "notifications-idx-channelId"
});
db.getCollection("notifications").createIndex({
    assetNodeId: NumberInt("1")
}, {
    name: "notifications-idx-assetNodeId"
});
db.getCollection("notifications").createIndex({
    feedbackId: NumberInt("1")
}, {
    name: "notifications-idx-feedbackId"
});
db.getCollection("notifications").createIndex({
    actionType: NumberInt("1")
}, {
    name: "notifications-idx-actionType"
});
db.getCollection("notifications").createIndex({
    actorId: NumberInt("1")
}, {
    name: "notifications-idx-actorId"
});
db.getCollection("notifications").createIndex({
    receiverId: NumberInt("1")
}, {
    name: "notifications-idx-receiverId"
});
db.getCollection("notifications").createIndex({
    createdAt: NumberInt("1")
}, {
    name: "notifications-idx-createdAt"
});
