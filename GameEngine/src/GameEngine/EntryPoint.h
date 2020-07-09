#pragma once

#ifdef GE_PLATFORM_WINDOWS

extern GameEngine::Application* GameEngine::CreateApplication();

int main(int argc, char** argv)
{
	GameEngine::Log::Init();
	GE_CORE_WARN("GameEngine Log iniciado!");
	GE_INFO("Application Log iniciado! Var={0}", 5);

	auto app = GameEngine::CreateApplication();
	app->Run();
	delete app;
}

#endif