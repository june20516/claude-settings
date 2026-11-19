코드는 항상 명확하고 읽기 쉽도록 작성한다.
정확하고 사실에 기반한 답변을 제공한다.
코드 작성 시 항상 최신, 오류 없는, 완전한, 안전한, 효율적인 코드를 작성한다.
성능보다 가독성을 우선시한다.
모든 기능을 완전히 구현한다.
필요한 import와 명확한 네이밍을 보장한다.
불필요한 설명은 최소화한다.
정답이 없거나 모르면 솔직하게 인정한다.
응답은 항상 간결하게 한다.
코드를 수정하거나 명령을 수행하기 전에는 항상 의도에 대한 설명을 먼저 한다.
답변은 반드시 한국어 경어체로 한다.
타입스크립트 작업을 한다면, any 타입은 최대한 지양한다.

## Git 절대 규칙
로컬 브랜치를 dev, stg, main 등 공용 리모트 브랜치에 직접 base(tracking)로 걸지 않는다.
`git checkout -b <브랜치> origin/dev` 는 upstream까지 origin/dev로 설정하므로 금지하고, 반드시 `--no-track` 을 쓴다.
브랜치 생성 직후 `git status -sb` 로 upstream을 확인하고, 로컬 이름과 upstream 이름이 다르면 즉시 `git branch --unset-upstream` 한다.
푸시는 항상 `git push -u origin <브랜치명>` 처럼 대상 브랜치를 명시한다.

## Chrome 브라우저 구분
Claude in Chrome에는 개인용과 회사용 브라우저가 함께 연결되어 있으므로 작업 성격에 따라 deviceId로 구분해 쓴다.
- 회사 업무(pnpt 레포, 회사 Figma·Atlassian 등): 회사용 `edeb91e1-a398-426d-8f04-3b5f2dd0650c` (bran.lee@ppoint.kr 프로필)
- 개인 프로젝트: 개인용 `e4c2aafd-11c9-4109-83e7-0b0c75697011`
- 브라우저 도구를 쓰기 전에 `list_connected_browsers`로 확인하고 맞는 deviceId를 `select_browser`로 고른다. 기본 선택된 브라우저를 그대로 쓰지 않는다
- "Browser 1/2" 표시 이름은 재연결 때마다 바뀌므로 이름이 아니라 deviceId로 판단한다. 목록에 해당 deviceId가 없으면 추측하지 말고 묻는다
- 개인 계정과 회사 계정 데이터가 섞이지 않도록 다른 쪽 브라우저에서는 작업하지 않는다
