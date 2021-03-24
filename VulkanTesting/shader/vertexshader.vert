#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(binding = 0) uniform UniformBufferObject {
	mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inNormal;
layout(location = 2) in vec2 inTexCoord;

layout(location = 0) out vec3 fragCoord;
layout(location = 1) out vec3 fragNormal; 
layout(location = 2) out vec2 fragTexCoord;

void main() {
	vec4 tmpCoords =  ubo.view * ubo.model * vec4(inPosition, 1.0);
	fragCoord = vec3(tmpCoords) / tmpCoords.w;
    gl_Position = ubo.proj * tmpCoords;
    fragNormal = mat3(ubo.view) * mat3(ubo.model) * inNormal;
    fragTexCoord = inTexCoord;
}