package sec03.exam02_no_name_implement_class;

public class RemoteControlExample {

	public static void main(String[] args) {
		RemoteControl rc = new RemoteControl() {

			@Override
			public void turnOn() {	}

			@Override
			public void turnOff() { }

			@Override
			public void setVolume(int volume) { }
			
		};
		
		RemoteControl rc2 = new RemoteControl() {

			@Override
			public void turnOn() {	}

			@Override
			public void turnOff() { }

			@Override
			public void setVolume(int volume) { }
			
		};
	}

}
