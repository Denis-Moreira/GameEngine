#pragma once

#ifdef GE_PLATFORM_WINDOWS
	#ifdef GE_BUILD_DLL
		#define GE_API __declspec(dllexport)
	#else
		#define GE_API __declspec(dllimport)
	#endif
#else
	#error Game Engine suporta apenas Windows!
#endif

#ifdef GE_ENABLE_ASSERTS
	#define GE_ASSERT(X, ...) { if(!(x)) { GE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); }}
	#define GE_CORE_ASSERT(X, ...) { if(!(x)) { GE_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); }}
#else
	#define GE_ASSERT(X, ...)
	#define GE_CORE_ASSERT(X, ...)
#endif

#define BIT(x) (1 << x)