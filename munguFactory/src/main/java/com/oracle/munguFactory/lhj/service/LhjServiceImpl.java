package com.oracle.munguFactory.lhj.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oracle.munguFactory.lhj.dao.LhjDao;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LhjServiceImpl implements LhjService {
	private final LhjDao hjd;


}
