const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

exports.sendNotificationToPoliceTopic = functions.firestore.document('users/{uid}').onUpdate(async (event) => {
    let content = event.after.get('police message');
    var message = {
        notification: {
            title: 'New Report',
            body: content,
        },
        topic: 'Police',
    };

    let response = await admin.messaging().send(message);
    console.log(response);
});
exports.sendNotificationToFireTopic = functions.firestore.document('users/{uid}').onUpdate(async (event) => {
  let content = event.after.get('fire message');
  var message = {
      notification: {
        title: 'New Report',
        body: content,
      },
      topic: 'Fire',
  };

  let response = await admin.messaging().send(message);
  console.log(response);
});
exports.sendNotificationToHospitalTopic = functions.firestore.document('users/{uid}').onUpdate(async (event) => {
  let content = event.after.get('hospital message');
  var message = {
      notification: {
        title: 'New Report',
          body: content,
      },
      topic: 'Hospital',
  };

  let response = await admin.messaging().send(message);
  console.log(response);
});