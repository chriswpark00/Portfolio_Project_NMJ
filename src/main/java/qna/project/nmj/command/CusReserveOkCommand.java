package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.ReservationDTO;
import qna.project.nmj.beans.dao.CustomerDAO;

public class CusReserveOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		Map<String, Object> map = model.asMap();
		ReservationDTO dto = (ReservationDTO)map.get("dto");
		CustomerDAO dao = C.sqlSession.getMapper(CustomerDAO.class);
		if(dto.getReservation_start().split("-").length > 1) {
			String date = dto.getReservation_start();
			dto.setReservation_start(date.split("-")[0].trim());
			System.out.println(dto.getReservation_start());
			if(dto.getReservation_end() != null) {
			dto.setReservation_end(date.split("-")[1].trim());
			}
			System.out.println(dto.getReservation_end());
		}
		if(dto.getReservation_date() != null && dto.getReservation_date().length() > 0) {
			String date = dto.getReservation_date();
			dto.setReservation_date(null);
			dto.setReservation_start(date + " " +dto.getReservation_start());
			if(dto.getReservation_end() != null) {
				
				dto.setReservation_end(date + " " +dto.getReservation_end());
			}
		}
		cnt = dao.insertReservation(dto);
		
		model.addAttribute("result", cnt);
	}

}
