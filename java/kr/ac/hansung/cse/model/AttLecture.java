package kr.ac.hansung.cse.model;

import javax.validation.constraints.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString 
public class AttLecture {
	
	//년도와 학기는 고정되니까 오류메시지를 출력할 필요가 없다.
	private int year;
	
	private int term;
	// |^$ 이부분을 넣어줘야 오류메시지가 2개로 출력되지 않는다. CSE숫자*4개 이런 형식으로 쓰지 않으면 오류가 출력된다.
	@NotEmpty(message="교과코드가 비어있습니다")
	@Pattern(regexp="^CSE[0-9]{4}$|^$", message="유효하지 않은 교과코드입니다")
	private String code;
	
	@NotEmpty(message="교과목명이 비어있습니다")
	private String title;
   // 아무것도 입력하지 않았을 시에 비어있다고 오류가 뜬다. 전선,전필,교양 이 3개중에 하나를 써야한다.
	@NotEmpty(message="교과구분이 비어있습니다")
	@Pattern(regexp="^(전선|전필|교양)$|^$", message="유효하지 않은 교과코드입니다")
	private String part;
	
	@NotEmpty(message="담당교수가 비어있습니다")
    private String professor;

	//숫자는 @Pattern을 사용할 수 없다.
	@DecimalMin(value = "1", message = "학점이 1 이상이어야 합니다.")
	@DecimalMax(value = "3", message = "학점이 3 이하이어야 합니다.")
	private int credit;
	
	
	
}
