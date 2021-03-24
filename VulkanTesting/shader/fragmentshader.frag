#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(location = 0) in vec3 fragCoord;
layout(location = 1) in vec3 fragNormal;
layout(location = 2) in vec2 fragTexCoord;
layout(binding = 1) uniform sampler2D texSampler;
layout(binding = 2) uniform UniformFragmentBuffer {
	vec3 directionalLight;
} ufb;

layout(location = 0) out vec4 outColor;

void main() {
	vec3 N = normalize(fragNormal);
	vec3 L = normalize(ufb.directionalLight);

	float lambertian = max(dot(N, L), 0.0f);
	float specular = 0.0f;
	if (lambertian > 0.0f) {
		vec3 R = reflect(-L, N);
		vec3 V = normalize(-fragCoord);
		float specAngle = max(dot(R, V), 0.0f);
		specular = pow(specAngle, 20.0f);
	}
	vec3 texColor = vec3(texture(texSampler, fragTexCoord));
	outColor = vec4(0.2f * texColor +
						0.6f * lambertian * texColor +
						0.8f * specular * texColor, 1.0);
}