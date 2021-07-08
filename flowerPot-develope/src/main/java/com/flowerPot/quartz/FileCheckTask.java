package com.flowerPot.quartz;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileCheckTask {

	@Scheduled(cron="0/10 0 0 * * *")
	public void checkFiles() throws Exception{
		log.warn("나와라아");
		System.out.println("나와라아");
	}
}
