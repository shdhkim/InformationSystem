package kr.ac.hansung.cse.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.cse.model.AttLecture;
//스프링에서 스캔하다가 @Component가 있으면 해당되는 class를 바탕으로 하여 빈으로 등록해준다.
@Repository

public class AttLectureDao {
	private JdbcTemplate jdbcTemplate;

	//이 메소드를 호출할 시에 DataSource를 의존성 주입을 통해서 주입해 준다.
	@Autowired
	 public void setDataSource(DataSource dataSource) {

		
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 수강 학기별 데이터베이스를 보기 위한 메소드이다.
	public List<AttLecture> getLecture() {
		String sqlStatement = "select distinct 수강년도, 학기, sum(학점) from courses "
				+ "group by 수강년도, 학기 order by 수강년도 asc;";
		return jdbcTemplate.query(sqlStatement, new RowMapper<AttLecture>() {

			@Override
			public AttLecture mapRow(ResultSet rs, int rowNum) throws SQLException {

				 AttLecture lecture = new AttLecture();

				 lecture.setYear(rs.getInt("수강년도"));
				 lecture.setTerm(rs.getInt("학기"));
				 lecture.setCredit(rs.getInt(3));

				return lecture;
			}
		});

	}
	// 년도와 학기를 인자로 받아서 해당 년도와 학기에 따른 데이터를 리턴한다.
	
	public List<AttLecture> getLectureByYearTerm(int year, int term) {

		String sqlStatment = "select * from courses where 수강년도=? and 학기=?";

		return jdbcTemplate.query(sqlStatment, new Object[] { year  , term }, new RowMapper<AttLecture>() {

			@Override
			public AttLecture mapRow(ResultSet rs, int rowNum) throws SQLException {

				AttLecture lecture = new AttLecture();

				lecture.setYear(rs.getInt("수강년도"));
				lecture.setTerm(rs.getInt("학기"));
				lecture.setCode(rs.getString("교과코드"));
				lecture.setTitle(rs.getString("교과목명"));
				lecture.setPart(rs.getString("교과구분"));
				lecture.setCredit(rs.getInt("학점"));
				lecture.setProfessor(rs.getString("담당교수"));
				return lecture;
			}
		});
	}
	// DB에 삽입하는 메소드이다.
	public boolean insert(AttLecture lecture) {
		int year = lecture.getYear();
		int term = lecture.getTerm();
		String code = lecture.getCode();
		String title = lecture.getTitle();
		String part = lecture.getPart();
		int credit = lecture.getCredit();
		String professor = lecture.getProfessor();
		String sqlStatment = "insert into courses (수강년도, 학기, 교과코드, 교과목명, 교과구분,  담당교수,학점) values (?, ?, ?, ?, ?, ?, ?)";

		return (jdbcTemplate.update(sqlStatment,
				new Object[] { year, term, code, title, part, professor,credit }) == 1);
	}
	// DB를 수정하는 메소드이다. 
	public boolean update(AttLecture lecture) {

		int year = lecture.getYear();
		int term = lecture.getTerm();
		String code = lecture.getCode();
		String title = lecture.getTitle();
		String part = lecture.getPart();
		int credit = lecture.getCredit();
		String professor = lecture.getProfessor();
		String sqlStatment = "update courses set 수강년도=?, 학기=?, 교과코드=?, 교과목명=?, 교과구분=?, 담당교수=?, 학점=?";

		return (jdbcTemplate.update(sqlStatment,
				new Object[] { year, term, code, title, part, professor ,credit}) == 1);
	}
	// DB에 삭제하는 메소드이다.
	public boolean delete(int code) {

		String sqlStatment = "delete from courses where 교과코드=?";

		return (jdbcTemplate.update(sqlStatment, new Object[] { code }) == 1);
	}
}
