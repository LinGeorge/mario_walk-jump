#version 330 core
out vec4 FragColor;

in vec3 ourColor;
in vec2 TexCoord;
flat in int mariocontroller;

uniform sampler2D r1; // 連續圖
uniform sampler2D r2;
uniform sampler2D r3;
uniform sampler2D r_jump;
uniform sampler2D l1; // 連續圖
uniform sampler2D l2;
uniform sampler2D l3;
uniform sampler2D l_jump;


uniform float time;

vec2 iResolution = vec2(800., 600.);


void main()
{    

	// 站立
	if(mariocontroller == 0){ // 右
		if(texture(r1, TexCoord).a < 0.1){
			discard;
		}
		FragColor = texture(r1, TexCoord);
	}
	else if(mariocontroller == 4){ // 左
		if(texture(l1, TexCoord).a < 0.1){
			discard;
		}
		FragColor = texture(l1, TexCoord);
	}

	// 走路
	else if(mariocontroller == 1){ // 右
		if(int(floor(time*8))%2 == 0){
			if(texture(r2, TexCoord).a < 0.1){
				discard;
			}
			FragColor = texture(r2, TexCoord);
		}
		else{
			if(texture(r3, TexCoord).a < 0.1){
				discard;
			}
			FragColor = texture(r3, TexCoord);
		}
	}
	else if(mariocontroller == 5){ // 左
		if(int(floor(time*8))%2 == 0){
			if(texture(l2, TexCoord).a < 0.1){
				discard;
			}
			FragColor = texture(l2, TexCoord);
		}
		else{
			if(texture(l3, TexCoord).a < 0.1){
				discard;
			}
			FragColor = texture(l3, TexCoord);
		}
	}

	// 跳躍
	else if(mariocontroller == 3){ // 右
		if(texture(r_jump, TexCoord).a < 0.1){
				discard;
		}
		FragColor = texture(r_jump, TexCoord);
	}
	else if(mariocontroller == 7){ // 左
		if(texture(l_jump, TexCoord).a < 0.1){
				discard;
		}
		FragColor = texture(l_jump, TexCoord);
	}

	

}

