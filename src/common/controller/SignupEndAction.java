package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import manager.domain.ManagerVO;
import prof.domain.ProfessorVO;
import student.domain.StudentVO;
import student.persistence.StudentDAOMyBatis;
import manager.persistence.ManagerDAOMyBatis;
import prof.persistence.ProfessorDAOMyBatis;

public class SignupEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("SignUPEndAction execute() calling....");
		// 1.사용자가 입력한 값 받기
		// 학생 관리자 교수 라디오 버튼 값
		String dividePeople = req.getParameter("a");
		String id = req.getParameter("id");
		String name = req.getParameter("sname");
		String gender = req.getParameter("gender");
		String major = req.getParameter("major");
		String pwd = req.getParameter("spwd");
		String hp1 = req.getParameter("shp1");
		String hp2 = req.getParameter("shp2");
		String hp3 = req.getParameter("shp3");
		String email = req.getParameter("semail");
		String addr = req.getParameter("saddr");

		System.out.println(dividePeople+id+name + gender + major +pwd + hp1 +
		hp2 + hp3 + email + addr);
		// 2.유효성 체크 => signup.do로 리다이렉트 이동
		String phone = hp1 + "-" + hp2 + "-" + hp3;

		if (name == null || phone == null || email == null || pwd == null || id == null || name.trim().isEmpty()
				|| phone.trim().isEmpty() || email.trim().isEmpty() || pwd.trim().isEmpty() || id.trim().isEmpty()) {
			this.setViewPage("signup.do");
			this.setRedirect(true);
			return;
		}

		int n = 0;
		switch (dividePeople) {
		case "student":
			// 3.StudentVO객체 생성해서 1번에서 받은 값 담아주기
			StudentVO user = new StudentVO(0, major, name, phone, addr, email, pwd, 0, 0, 0, 0, id, gender, null);
			// 4.StudentDAO 생성해서 addStudent()호출하기
			StudentDAOMyBatis dao = new StudentDAOMyBatis();
			n = dao.addStudent(user);
			break;

		case "professor":
			ProfessorVO puser = new ProfessorVO(0, 0, name, major, phone, addr, email, pwd, id, gender, 0, null);
			ProfessorDAOMyBatis pdao = new ProfessorDAOMyBatis();
			n = pdao.addProfessor(puser);

			break;

		case "admin":
			ManagerVO muser = new ManagerVO(0, name, phone, addr, email, pwd, id, gender, 0, null);
			ManagerDAOMyBatis mdao = new ManagerDAOMyBatis();
			n = mdao.addManager(muser);

			break;
		}

		// 5.그 결과 메시지 처리
		String msg = (n > 0) ? "가입 성공" : "가입 실패";
		String loc = (n > 0) ? "login.do" : "javascript:history.back()";
		String view = CommonUtil.addMsgLoc(req, msg, loc);
		this.setViewPage(view);
		this.setRedirect(false);
	}

}
