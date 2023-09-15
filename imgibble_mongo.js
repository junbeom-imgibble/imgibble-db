/*
 Navicat Premium Data Transfer

 Source Server         : DockerMongo
 Source Server Type    : MongoDB
 Source Server Version : 40406
 Source Host           : localhost:27017
 Source Schema         : imgibble

 Target Server Type    : MongoDB
 Target Server Version : 40406
 File Encoding         : 65001

 Date: 28/03/2023 11:30:34
*/


// ----------------------------
// Collection structure for advance_reservations
// ----------------------------
db.getCollection("advance_reservations").drop();
db.createCollection("advance_reservations");
db.getCollection("advance_reservations").createIndex({
    id: NumberInt("1")
}, {
    name: "id_1",
    background: true,
    unique: true
});

// ----------------------------
// Collection structure for assets
// ----------------------------
db.getCollection("assets").drop();
db.createCollection("assets");

// ----------------------------
// Collection structure for assets_nodes
// ----------------------------
db.getCollection("assets_nodes").drop();
db.createCollection("assets_nodes");

// ----------------------------
// Collection structure for assignees
// ----------------------------
db.getCollection("assignees").drop();
db.createCollection("assignees");

// ----------------------------
// Collection structure for attached_files
// ----------------------------
db.getCollection("attached_files").drop();
db.createCollection("attached_files");

// ----------------------------
// Collection structure for attached_music
// ----------------------------
db.getCollection("attached_music").drop();
db.createCollection("attached_music");

// ----------------------------
// Collection structure for channels_sections
// ----------------------------
db.getCollection("channels_sections").drop();
db.createCollection("channels_sections");

// ----------------------------
// Collection structure for confirm_assets
// ----------------------------
db.getCollection("confirm_assets").drop();
db.createCollection("confirm_assets");
db.getCollection("confirm_assets").createIndex({
    assetId: NumberInt("1")
}, {
    name: "confirm_assets_asset_id_idx"
});

// ----------------------------
// Collection structure for event_expert_feedback
// ----------------------------
db.getCollection("event_expert_feedback").drop();
db.createCollection("event_expert_feedback");
db.getCollection("event_expert_feedback").createIndex({
    id: NumberInt("1")
}, {
    name: "id_1",
    background: true,
    unique: true
});

// ----------------------------
// Collection structure for favorites
// ----------------------------
db.getCollection("favorites").drop();
db.createCollection("favorites");

// ----------------------------
// Collection structure for feedbacks
// ----------------------------
db.getCollection("feedbacks").drop();
db.createCollection("feedbacks");

// ----------------------------
// Collection structure for file_references
// ----------------------------
db.getCollection("file_references").drop();
db.createCollection("file_references");
db.getCollection("file_references").createIndex({
    id: NumberInt("1")
}, {
    name: "id_1",
    background: true,
    unique: true
});

// ----------------------------
// Collection structure for guide_groups
// ----------------------------
db.getCollection("guide_groups").drop();
db.createCollection("guide_groups");
db.getCollection("guide_groups").createIndex({
    id: NumberInt("1")
}, {
    name: "id_1",
    background: true,
    unique: true
});

// ----------------------------
// Collection structure for guides
// ----------------------------
db.getCollection("guides").drop();
db.createCollection("guides");
db.getCollection("guides").createIndex({
    id: NumberInt("1")
}, {
    name: "id_1",
    background: true,
    unique: true
});

// ----------------------------
// Collection structure for linkage_canvas_projects
// ----------------------------
db.getCollection("linkage_canvas_projects").drop();
db.createCollection("linkage_canvas_projects");

// ----------------------------
// Collection structure for linkage_canvas_users
// ----------------------------
db.getCollection("linkage_canvas_users").drop();
db.createCollection("linkage_canvas_users");

// ----------------------------
// Collection structure for linkage_canvases
// ----------------------------
db.getCollection("linkage_canvases").drop();
db.createCollection("linkage_canvases");

// ----------------------------
// Collection structure for new_file_references
// ----------------------------
db.getCollection("new_file_references").drop();
db.createCollection("new_file_references");
db.getCollection("new_file_references").createIndex({
    id: NumberInt("1")
}, {
    name: "id_1",
    background: true,
    unique: true
});

// ----------------------------
// Collection structure for noti_forms
// ----------------------------
db.getCollection("noti_forms").drop();
db.createCollection("noti_forms");
db.getCollection("noti_forms").createIndex({
    id: NumberInt("1")
}, {
    name: "id_1",
    background: true,
    unique: true
});

// ----------------------------
// Collection structure for schedules
// ----------------------------
db.getCollection("schedules").drop();
db.createCollection("schedules");

// ----------------------------
// Collection structure for share_links
// ----------------------------
db.getCollection("share_links").drop();
db.createCollection("share_links");

// ----------------------------
// Collection structure for share_links_users
// ----------------------------
db.getCollection("share_links_users").drop();
db.createCollection("share_links_users");

// ----------------------------
// Collection structure for subtitles
// ----------------------------
db.getCollection("subtitles").drop();
db.createCollection("subtitles");

// ----------------------------
// Collection structure for trial_tickets
// ----------------------------
db.getCollection("trial_tickets").drop();
db.createCollection("trial_tickets");
