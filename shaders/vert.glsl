#version 460

layout(location = 0) in vec3 position;
layout(location = 1) in vec3 normal;
layout(location = 2) in vec3 texture_coords;
            
layout(location = 0) out vec3 fragPosition;
layout(location = 1) out vec3 fragNormal;
layout(location = 2) out vec3 fragTextureCoords;
layout(location = 3) out vec3 cameraPosition;

layout(set = 0, binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 projection;
    vec3 camera_position;
} ubo;

void main() {
    gl_Position = ubo.projection * ubo.view * ubo.model * vec4(position, 1.0);
    fragPosition = vec3(ubo.model * vec4(position, 1.0));
    fragNormal = mat3(transpose(inverse(ubo.model))) * normal;
    fragTextureCoords = texture_coords;
    cameraPosition = ubo.camera_position;
}