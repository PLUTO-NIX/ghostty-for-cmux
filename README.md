---
created: 2026-04-23 13:28:25 +09:00
updated: 2026-04-23 13:28:56 +09:00
---
# ghostty-for-cmux

[cmux](https://github.com/manaflow-ai/cmux)에 최적화된 Ghostty 터미널 설정.
AI 코딩 에이전트 워크플로우에 맞춘 폰트, 테마, 패딩, 키바인딩을 제공한다.

## 구조

```
ghostty/
  config              # Ghostty 터미널 설정
  themes/
    cursor-dark       # Cursor IDE 다크 테마 포팅
cmux/
  settings.json       # cmux 앱 설정
install.sh            # 원커맨드 설치 스크립트
```

## 설치

```bash
git clone https://github.com/PLUTO-NIX/ghostty-for-cmux.git
cd ghostty-for-cmux
chmod +x install.sh
./install.sh
```

### 필수 폰트

설정 적용 전에 설치해야 한다:

- [JetBrains Mono](https://www.jetbrains.com/lp/mono/) — 기본 코드 폰트
- [Pretendard Variable](https://github.com/orioncactus/pretendard) — 한글 폴백 폰트 (선택)

## 설정 요약

### Ghostty (`ghostty/config`)

| 항목 | 값 | 설명 |
|---|---|---|
| 폰트 | JetBrains Mono 14pt | 리가처 활성 (`calt`, `liga`) |
| 한글 폰트 | Pretendard Variable | `font-codepoint-map`으로 유니코드 범위 매핑 |
| 줄 높이 | +15% | `adjust-cell-height`로 가독성 확보 |
| 커서 | 블록, 깜빡임 없음 | 로즈워터 색상 (`#f5e0dc`) |
| 패딩 | 16x12, 자동 중앙 정렬 | 텍스트가 가장자리에 붙지 않음 |
| 타이틀바 | 투명 | cmux 크롬과 자연스럽게 통합 |
| 분할 패널 | 비활성 50% 투명도 | 포커스 패널 즉시 식별 |
| 스크롤백 | 50,000줄 | 긴 에이전트 출력 대비 |
| 키바인딩 | Option+화살표 단어 점프 | Option+BS 단어 삭제 |

### cmux (`cmux/settings.json`)

| 항목 | 값 | 설명 |
|---|---|---|
| 미니멀 모드 | 켜짐 | 타이틀바 제거, 터미널 공간 최대화 |
| 첫 클릭 포커스 | 켜짐 | 비활성 패널 클릭으로 즉시 포커스 |
| 선택 색상 | `#2a3a4a` | 활성 워크스페이스 하이라이트 |

### cursor-dark 테마 (`ghostty/themes/cursor-dark`)

[Cursor IDE](https://cursor.com) 다크 테마를 포팅한 커스텀 테마.

| 요소 | 색상 |
|---|---|
| 배경 | `#141414` |
| 전경 | `#ffffff` |
| 커서 | `#ffffff` |
| 선택 영역 | `#303030` |

ANSI 팔레트는 Nord 계열 색상 기반.

## 커스터마이징

설정 수정 후 리로드:

```bash
cmux reload-config
# 또는 Cmd+Shift+,
```

폰트 변경은 새 탭을 열어야 적용될 수 있다.

## 알려진 제한사항

- `scrollbar = never`는 cmux에서 동작하지 않음 — macOS 시스템 설정에서 "스크롤할 때"로 변경 필요
- `font-family-map`은 Ghostty에 존재하지 않는 키 — `font-codepoint-map`을 사용해야 함
- cmux는 `~/.config/ghostty/config`를 읽음. `~/Library/Application Support/com.cmuxterm.app/config.ghostty`는 읽지 않음

## 라이선스

MIT
