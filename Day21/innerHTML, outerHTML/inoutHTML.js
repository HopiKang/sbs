const myTag = document.querySelector('#list-1');
const myTag1 = document.querySelector('#list-2');
// console.log(myTag.innerHTML);
// myTag.innerHTML = '<li>멜론</li>';
// list를 멜론으로 교체
// myTag.innerHTML += '<li>멜론</li>';
//마지막 줄에 멜론추가

// console.log(myTag.outerHTML);
// 새로운 HTML을 할당할수있다
// myTag.outerHTML = '<ul id="new-list">두리안</ul>';

//textContent
//텍스트만 가져온다
//특수한문자도 텍스트로 처리한다
// console.log(myTag.textContent);
// myTag.textContent = 'new text';
//텍스트전체를 바꿈
// myTag.textContent = '<li>new text</li>';

/*
요소 노드 만들기
요소 노드 꾸미기 (textContent, innerHTML)
요소 노드 추가하기 (Node.prepend, append, after, before)
*/
// const first = document.createElement('li');
// 태그이름으로 요소노드를 만들수있다
// first.textContent = '처음';
//<li>처음</li>
// myTag.prepend(first);
//list-1 에 <li>처음</li> 추가

// const last = document.createElement('li');
// last.textContent = '마지막';
// myTag.append(last);

// const prev = document.createElement('li');
// prev.textContent = '마지막';
// myTag.before('문자열', prev);

// const next = document.createElement('p');
// prev.textContent = '다음';
// myTag.after(next);

//노드 삭제하기
//remove
//myTag.children[2].remove()
//2번째에 추가

//prepend, append, before, after
myTag.children[1].after(myTag1.children[1]);
