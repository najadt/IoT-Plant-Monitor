# Concept
The concept is to run a WebSocket server in XIAO ESP32C which will read and calibrate the data from a bunch of sensors like a Soil Moisture Sensor, pH Sensor, Temperature Sensor, and Humidity Sensor and send all this information in JSON format to connected clients via the WebSockets whenever the client request for the data.

In our case, the client is a mobile application built in Flutter that can handle multiple WebSocket connections and display all the received information in the app dashboard in an elegant graphical interface.

![](https://diyusthad.com/wp-content/uploads/2022/11/WebSocket-1024x576.gif)

Note, in the below example we are only using a Soil Moisture Sensor because currently, I am not having the other sensors.

Project Link: https://diyusthad.com/2022/11/iot-plant-monitor-using-xiao-esp32-flutter-app.html

