package polymorphism_4_2_2;

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
