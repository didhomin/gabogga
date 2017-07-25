package com.gbg.util;

public class NumberCheck {
	
	public static int nullToZero(String tmp) {
		int num = 0;
		if(isNumber(tmp))
			num = Integer.parseInt(tmp);
		return num;
	}
	
	public static int nullToOne(String tmp) {
		int num = 1;
		if(isNumber(tmp))
			num = Integer.parseInt(tmp);
		return num;
	}

	private static boolean isNumber(String tmp) {
		boolean isnum = true;
		
		if(tmp!=null && !tmp.isEmpty()){ //null�� �ƴϰ�, ������� �ʴٸ�
			int len = tmp.length();
			for(int i=0; i<len; i++){
				if(tmp.charAt(i)<48 || tmp.charAt(i)>57) { //���ڰ� �ƴҰ��! (48~57�� ����)
					isnum = false;
					break;
				}
			}
		} else {
			isnum = false;
		}
		return isnum;
	}
	
}
