package polymorphism_2_3_1;

public class TVUser {

	public static void main(String[] args) {
		/*
		SamsungTV tv = new SamsungTV();		
			//������ ����, (�����ڰ� ���� ���α׷� �ڵ峻���� ��ü�� ����)
		tv.powerOn();
		tv.powerOff();
		tv.volumeUp();
		tv.volumeDown();
		*/
		
		
		//������� �䱸�� ���ؼ� Samsung TV���� LgTV�� ����
			//��ü ����, �޼ҵ��̸� ��� ����
		LgTV tv = new LgTV();
		tv.turnOn();
		tv.turnoff();
		tv.soundUp();
		tv.soundDown();
		
		
		

	}

}
