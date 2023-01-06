package com.oracle.munguFactory.ljw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.dto.SubulDTO;
import com.oracle.munguFactory.ljw.dao.ljwDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ljwServiceImpl implements ljwService {
	private final ljwDao dao;

	@Override
	public List<SubulDTO> getAllSubulList() {
		log.info("getAllSubulList() start...");
		return dao.getAllSubulList();
	}

}
