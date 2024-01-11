function! mintodo#IsDone(str)
  " Judge a task is done status
  let isInclude = match(a:str, '\[x\]')
  let result = 1
  if isInclude == -1
    unlet result
    let result = 0
  endif
  return result
endfunction

function! mintodo#ToggleTask()
  " Toogle a task status
  let row = getline('.')
  if mintodo#IsDone(row) == 1
    call mintodo#UndoTask()
  else
    call mintodo#DoneTask()
  endif
endfunction

function! mintodo#DoneTask()
  " Make a task done status
  let row = getline('.')
  let replaced = substitute(row, '\[ \] ', '\[x\] '.strftime('`%Y-%m-%d %H:%M`').' ', 'g')
  call setline('.', replaced)
endfunction

function! mintodo#UndoTask()
  " Make a task uncheck status
  let row = getline('.')
  let replaced = substitute(row, '\[x\] `\d\{4\}-\d\{2\}-\d\{2\} \d\{2\}:\d\{2\}` ', '\[ \] ', 'g')
  call setline('.', replaced)
endfunction

function! mintodo#CreateTask()
  " Create a task
  let nowPos = getpos('.')
  let taskPrefix = "- [ ] "
  let col = col('$')
  call cursor('.', col)
  execute ':normal a' . taskPrefix
endfunction

function! mintodo#ArchiveTasks()
  let delList = []
  let i = 1
  let endLineNum = line("$")
  while i < endLineNum
    " copy if task is done
    let currentLine = getline(i)
    if mintodo#IsDone(currentLine) == 1
        call append(endLineNum, currentLine)
        let delList = insert(delList, i, 0)
    endif
    let i = i + 1
  endwhile
  " delete lines
  for n in delList
    execute n . "delete" |
  endfor
  " sort line
  let startLineNum = line("$") - len(delList)
  let lines = getline(startLineNum, endLineNum)
  call reverse(sort(lines))
  call setline(startLineNum, lines)
endfunction

