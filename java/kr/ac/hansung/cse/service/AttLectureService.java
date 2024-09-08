package kr.ac.hansung.cse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.cse.dao.AttLectureDao;
import kr.ac.hansung.cse.model.AttLecture;

@Service
public class AttLectureService {

	@Autowired
	private AttLectureDao attLectureDao;
	

	
	public List<AttLecture> getLecture() {
		return attLectureDao.getLecture();
	}

	public void insert(AttLecture lecture) {
		attLectureDao.insert(lecture);
	}
	
	//년도와 학기 입력

	public List<AttLecture> getLectureByYT(int year, int term) {
		return attLectureDao.getLectureByYearTerm(year, term);
	}
	


}
