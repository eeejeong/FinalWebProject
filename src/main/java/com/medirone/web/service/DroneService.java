package com.medirone.web.service;

import javax.annotation.PreDestroy;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medirone.web.dao.MissionDao;
import com.medirone.web.dao.RequestDao;

@Service
public class DroneService {
private static final Logger logger = LoggerFactory.getLogger(DroneService.class);

	@Autowired
	private MissionDao missionDao;
	@Autowired
	private RequestDao requestDao;
			
	private MqttClient client;
	
	public DroneService() {
		mqttConnect();
	}
	
	private void mqttConnect() {
		try {
			client = new MqttClient("tcp://106.253.56.124:1884", MqttClient.generateClientId(), null);
			client.connect();
			receiveMessage();
			logger.debug("Mqtt Broker에 연결 성공: tcp://106.253.56.124:1884");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void mqttDisconnect() {
		try {
			client.disconnectForcibly(1);
			client.close(true);
			logger.debug("Mqtt Broker 강제로 연결 끊기 성공");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@PreDestroy
	public void destory() {
		logger.debug("Mqtt 종료 시키기");
		mqttDisconnect();
	}

	
	private void receiveMessage() throws MqttException {
		client.setCallback(new MqttCallback() {
			@Override
			public void messageArrived(String topic, MqttMessage message) throws Exception {
				byte[] bytes = message.getPayload();
				String json = new String(bytes);
				JSONObject jsonObject = new JSONObject(json);
				String mid = (String) jsonObject.get("msgid");
				
				if(mid.equals("MISSION_UPLOAD")) {
					logger.debug("===MISSION_UPLOAD==");
					String aID = (String) jsonObject.get("aID");
					String items = (String) jsonObject.get("items");
					logger.debug("aID: " + aID);
					logger.debug("items: " + items);
					missionDao.updateMission(aID, items);
				}
				// 드론이 미션 시작했을 때
				else if(mid.equals("MISSION_START")) {		
					logger.debug("===MISSION_START==");
					int order_id = (Integer)jsonObject.get("orderId");
					logger.debug(""+order_id);
					requestDao.updateOrderStatus(order_id, OrderStatus.DELIVERING);	// request 상태를 delivering(배송 중)으로 
				}
				// 드론이 Land 후 의약품 분리까지 완료했을 때
				else if(mid.equals("MISSION_ACTION")) {
					logger.debug("===MISSION_ACTION==");
					int order_id = (Integer)jsonObject.get("orderId");
					logger.debug("mission action 메세지 도착, " + order_id);
					requestDao.updateOrderStatus(order_id, OrderStatus.DELIVERED);	// request 상태를 delivered(배송 완료)로 
					requestDao.updateDeliveredDate(order_id);
				} 
											
			}
			
			@Override
			public void deliveryComplete(IMqttDeliveryToken token) {
				
				
			}
			
			@Override
			public void connectionLost(Throwable cause) {
				
				
			}
		});	
		client.subscribe("/drone/mission/pub");
	}
	
}
	


