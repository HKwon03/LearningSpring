package polymorphism_5_2_1;

import org.springframework.stereotype.Component;

@Component("apple")	//Speaker Ÿ�԰� AppleSpeaker Ÿ�� ��θ� ����
public class AppleSpeaker implements Speaker {
	
	public AppleSpeaker() {
		System.out.println("==> AppleSpeaker ��ü ����");
	}
	
	@Override
	public void volumeUp() {
		System.out.println("AppleSpeaker -- ���� ��");

	}

	@Override
	public void volumeDown() {
		System.out.println("AppleSpeaker -- ���� �ٿ�");

	}

}