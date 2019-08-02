package com.bitcamp.mvc.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.mvc.domain.OrderCommand;
import com.bitcamp.mvc.domain.OrderItem;

@Controller
@RequestMapping("/order/order")
public class OrderController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String getForm() {
		
		return "product/form";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String order(@ModelAttribute("orders") OrderCommand orders) {
	// post방식으로 보낼때 실행 -> useBean의 setProperty처럼 OrderCommand의 변수에 자동 저장
	// 추가적으로 @ModelAttribute로 이름 설정
	
		System.out.println(orders.getAddress());
		
		for(OrderItem item : orders.getOrderItems()) {
			System.out.println(item);
		}
		
		return "product/order";
	}
	
	
}
