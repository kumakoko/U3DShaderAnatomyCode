Shader "Custom/BasicDiffuse" 
{  
    Properties 
    {
        _EmissiveColor ("Emissive Color", Color) = (1,1,1,1)
        _MainTex ("Main Texture", 2D) = "white"{}
    }
    
    SubShader
    {
        Tags { "RenderType"="Opaque" "RenderType"="Opaque" }  

        LOD 200

        CGPROGRAM
        #pragma surface surf BasicDiffuse vertex:vert finalcolor:final noforwardadd
        #pragma debug
        
        // 指定自身的自发光颜色
        float4 _EmissiveColor;
        sampler2D _MainTex;

        // vs to fs的结构体
        struct Input
        {
            float2 uv_MainTex;
        };

        void vert(inout appdata_full v, out Input o)
        {
            o.uv_MainTex = v.texcoord.xy;
        }  

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = (_EmissiveColor.rgb + tex2D(_MainTex, IN.uv_MainTex).rgb);
            o.Alpha = _EmissiveColor.a;
        }

        inline float4 LightingBasicDiffuse (SurfaceOutput s, fixed3 lightDir, fixed atten)
        {
            float angle_cos = max(0, dot (s.Normal, lightDir));
            float4 col;
            col.rgb = s.Albedo.rgb * _LightColor0.rgb * angle_cos * atten;
            col.a = s.Alpha;
            return col;
        }

        void final(Input IN, SurfaceOutput o, inout fixed4 color)
        {

        }

        ENDCG
    }   
    FallBack "Diffuse"  
}  