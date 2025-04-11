const sql = require("mysql2/promise");
const connectDB = require("../config/db");

class Message {
  static async sendMessage(message) {
    try {
      const connection = await connectDB();
      const [result] = await connection.execute(
        `INSERT INTO Messages (senderID, receiverID, messageText, senderType, receiverType)
         VALUES (?, ?, ?, ?, ?)`,
        [
          message.senderID,
          message.receiverID,
          message.messageText,
          message.senderType,
          message.receiverType,
        ]
      );
      return {
        messageID: result.insertId,
        ...message,
        timestamp: new Date(),
      };
    } catch (error) {
      console.error("Error sending message:", error.message);
      throw error;
    }
  }

  static async getMessage(senderID, receiverID) {
    const connection = await connectDB();
    const [rows] = await connection.execute(
      `SELECT messageID, senderID, receiverID, messageText, timestamp, senderType, receiverType
       FROM Messages
       WHERE (senderID = ? AND receiverID = ?)
          OR (senderID = ? AND receiverID = ?)
       ORDER BY timestamp ASC`,
      [senderID, receiverID, receiverID, senderID]
    );
    return rows;
  }
}

module.exports = Message;
