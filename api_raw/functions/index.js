const functions = require('firebase-functions');
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();

exports.listenToPlayListAdd = functions.region('asia-east2').firestore
    .document("audio/{audioId}")
    .onCreate(async (snap, context) => {
        console.log(`something got added ${snap.data()}`)
        console.log(`audioid ${audioId}`)
        var audioId = context.params.audioId;
        await db.collection("playlists").doc(audioId).set({
            "dummy": "qwert"

        }).catch(err => {
            console.log("error in updating the itemcoung", err);
        });

    });

