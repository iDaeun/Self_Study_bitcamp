package com.bitcamp.mvc.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.mvc.domain.SearchType;

@Controller
public class SearchController {
	
	@RequestMapping("/search/search")
	public String searchForm() {
		return "search/form";
	}
	
	@ModelAttribute("searchType") // 리턴값 -> view에서 공유할 수 있음
	public List<SearchType> getSearchType(){
		
		List<SearchType> options = new ArrayList<SearchType>();
		
		options.add(new SearchType(1, "전체"));
		options.add(new SearchType(2, "제목"));
		options.add(new SearchType(3, "내용"));
		options.add(new SearchType(4, "제목+내용"));
		
		return options;
	}
	
	@ModelAttribute("popularList")
	public String[] getPopularList() {
		return new String[] {"일번","이번","삼번","사번"};
	}
}
