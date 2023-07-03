#include <iostream>

class Log {
 public:
  enum Level {
    LevelError = 0, LevelWarning, LevelInfo
  };
 private:
  Level m_LogLevel = LevelInfo;
 public:
  void SetLevel(Level level) {
    m_LogLevel = level;
  }

  void Error(const char* message) {
    if (m_LogLevel >= LevelError)
      std::cout << "[ERROR]: " << message << std::endl;
  }

  void Warn(const char* message) {
    if (m_LogLevel >= LevelWarning)
      std::cout << "[WARNING]: " << message << std::endl;
  }

  void Info(const char* message) {
    if (m_LogLevel >= LevelInfo)
      std::cout << "[INFO]: " << message << std::endl;
  }
};

struct Entity {
  int x, y;

  void add(const Entity& other) {
    x += other.x;
    y += other.y;
  }
};

class Player {
 public:
  int x, y;
  int speed;

  void move(int xa, int ya) {
    x += xa * speed;
    y += ya * speed;
  }
};

int main() {
  Log log;
  log.SetLevel(Log::LevelError);
  log.Error("Hello!");
  log.Warn("Hello!");
  log.Info("Hello!");

  std::cin.get();
}