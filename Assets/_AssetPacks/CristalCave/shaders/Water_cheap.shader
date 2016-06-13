// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'


/*SF_DATA;ver:1.10;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:3,spmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1900,x:33471,y:32818,varname:node_1900,prsc:2|diff-837-OUT,spec-6498-OUT,gloss-3590-OUT,normal-8373-OUT,emission-8883-RGB;n:type:ShaderForge.SFN_Tex2d,id:2117,x:32550,y:32679,varname:_node_2117,prsc:2,tex:aba06f8af729c9e4fa841a4dc7d578c5,ntxv:3,isnm:True|UVIN-9481-OUT,TEX-416-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:416,x:32200,y:32927,ptovrint:False,ptlb:water normal,ptin:_waternormal,varname:_waternormal,tex:aba06f8af729c9e4fa841a4dc7d578c5,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:8832,x:32629,y:33086,varname:_node_8832,prsc:2,tex:aba06f8af729c9e4fa841a4dc7d578c5,ntxv:0,isnm:False|UVIN-5926-OUT,TEX-416-TEX;n:type:ShaderForge.SFN_FragmentPosition,id:3735,x:32046,y:33170,varname:node_3735,prsc:2;n:type:ShaderForge.SFN_Append,id:322,x:32039,y:32782,varname:node_322,prsc:2|A-3735-X,B-3735-Z;n:type:ShaderForge.SFN_Divide,id:8549,x:32222,y:32715,varname:node_8549,prsc:2|A-322-OUT,B-2141-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2141,x:31789,y:32590,ptovrint:False,ptlb:scale 1,ptin:_scale1,varname:_scale1,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Divide,id:7177,x:32332,y:32884,varname:node_7177,prsc:2|A-322-OUT,B-9477-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9477,x:31951,y:32978,ptovrint:False,ptlb:scale 2,ptin:_scale2,varname:_scale2,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_NormalBlend,id:8373,x:32684,y:32882,varname:node_8373,prsc:2|BSE-2117-RGB,DTL-8832-RGB;n:type:ShaderForge.SFN_Time,id:2097,x:32019,y:32449,varname:node_2097,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9436,x:32326,y:32423,varname:node_9436,prsc:2|A-9979-OUT,B-2097-T;n:type:ShaderForge.SFN_ValueProperty,id:9979,x:31910,y:32685,ptovrint:False,ptlb:speed 1,ptin:_speed1,varname:_speed1,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:7305,x:32105,y:32685,ptovrint:False,ptlb:speed 2,ptin:_speed2,varname:_speed2,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:946,x:32356,y:32773,varname:node_946,prsc:2|A-7305-OUT,B-2097-T;n:type:ShaderForge.SFN_Add,id:5926,x:32514,y:32884,varname:node_5926,prsc:2|A-7177-OUT,B-946-OUT;n:type:ShaderForge.SFN_Add,id:9481,x:32387,y:32590,varname:node_9481,prsc:2|A-9436-OUT,B-8549-OUT;n:type:ShaderForge.SFN_Vector1,id:6498,x:33027,y:32833,varname:node_6498,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:3590,x:32847,y:32998,varname:node_3590,prsc:2,v1:0.9;n:type:ShaderForge.SFN_Vector1,id:837,x:32947,y:32711,varname:node_837,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Color,id:8883,x:33150,y:33014,ptovrint:False,ptlb:emmis,ptin:_emmis,varname:_emmis,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:416-2141-9477-9979-7305-8883;pass:END;sub:END;*/

Shader "Almgp/Water_cheap" {
    Properties {
        _waternormal ("water normal", 2D) = "bump" {}
        _scale1 ("scale 1", Float ) = 1
        _scale2 ("scale 2", Float ) = 1
        _speed1 ("speed 1", Float ) = 1
        _speed2 ("speed 2", Float ) = 1
        _emmis ("emmis", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _waternormal; uniform float4 _waternormal_ST;
            uniform float _scale1;
            uniform float _scale2;
            uniform float _speed1;
            uniform float _speed2;
            uniform float4 _emmis;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float3 tangentDir : TEXCOORD2;
                float3 bitangentDir : TEXCOORD3;
                LIGHTING_COORDS(4,5)
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_2097 = _Time + _TimeEditor;
                float2 node_322 = float2(i.posWorld.r,i.posWorld.b);
                float2 node_9481 = ((_speed1*node_2097.g)+(node_322/_scale1));
                float3 _node_2117 = UnpackNormal(tex2D(_waternormal,TRANSFORM_TEX(node_9481, _waternormal)));
                float2 node_5926 = ((node_322/_scale2)+(_speed2*node_2097.g));
                float3 _node_8832 = UnpackNormal(tex2D(_waternormal,TRANSFORM_TEX(node_5926, _waternormal)));
                float3 node_8373_nrm_base = _node_2117.rgb + float3(0,0,1);
                float3 node_8373_nrm_detail = _node_8832.rgb * float3(-1,-1,1);
                float3 node_8373_nrm_combined = node_8373_nrm_base*dot(node_8373_nrm_base, node_8373_nrm_detail)/node_8373_nrm_base.z - node_8373_nrm_detail;
                float3 node_8373 = node_8373_nrm_combined;
                float3 normalLocal = node_8373;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = 0.9;
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                UnityGI gi = UnityGlobalIllumination (d, 1, gloss, normalDirection);
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float node_6498 = 1.0;
                float3 specularColor = float3(node_6498,node_6498,node_6498);
                float specularMonochrome = max( max(specularColor.r, specularColor.g), specularColor.b);
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
                float specularPBL = max(0, (NdotL*visTerm*normTerm) *  UNITY_PI / 4.0 );
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float node_837 = 0.1;
                float3 diffuseColor = float3(node_837,node_837,node_837);
                diffuseColor *= 1-specularMonochrome;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = _emmis.rgb;
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _waternormal; uniform float4 _waternormal_ST;
            uniform float _scale1;
            uniform float _scale2;
            uniform float _speed1;
            uniform float _speed2;
            uniform float4 _emmis;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float3 tangentDir : TEXCOORD2;
                float3 bitangentDir : TEXCOORD3;
                LIGHTING_COORDS(4,5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_2097 = _Time + _TimeEditor;
                float2 node_322 = float2(i.posWorld.r,i.posWorld.b);
                float2 node_9481 = ((_speed1*node_2097.g)+(node_322/_scale1));
                float3 _node_2117 = UnpackNormal(tex2D(_waternormal,TRANSFORM_TEX(node_9481, _waternormal)));
                float2 node_5926 = ((node_322/_scale2)+(_speed2*node_2097.g));
                float3 _node_8832 = UnpackNormal(tex2D(_waternormal,TRANSFORM_TEX(node_5926, _waternormal)));
                float3 node_8373_nrm_base = _node_2117.rgb + float3(0,0,1);
                float3 node_8373_nrm_detail = _node_8832.rgb * float3(-1,-1,1);
                float3 node_8373_nrm_combined = node_8373_nrm_base*dot(node_8373_nrm_base, node_8373_nrm_detail)/node_8373_nrm_base.z - node_8373_nrm_detail;
                float3 node_8373 = node_8373_nrm_combined;
                float3 normalLocal = node_8373;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = 0.9;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float node_6498 = 1.0;
                float3 specularColor = float3(node_6498,node_6498,node_6498);
                float specularMonochrome = max( max(specularColor.r, specularColor.g), specularColor.b);
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
                float specularPBL = max(0, (NdotL*visTerm*normTerm) * UNITY_PI / 4.0 );
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
                float node_837 = 0.1;
                float3 diffuseColor = float3(node_837,node_837,node_837);
                diffuseColor *= 1-specularMonochrome;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
  
}
