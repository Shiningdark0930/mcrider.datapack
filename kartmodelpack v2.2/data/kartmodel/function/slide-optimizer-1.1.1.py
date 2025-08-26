import re
import os
import sys

def return_MCF_path(directory):
    files = [f for f in os.listdir(directory) if f.endswith('.mcfunction')]
    
    if not files:
        print("해당 디렉토리에 .mcfunction 파일이 없습니다.")
        return None
    
    for i, file in enumerate(files):
        print(f"{i + 1}. {file}")
    
    while True:
        try:
            choice = int(input("수정할 파일 번호를 선택하세요: "))
            if 1 <= choice <= len(files):
                return os.path.join(directory, files[choice - 1])
            else:
                print("올바른 번호를 선택하세요.")
        except ValueError:
            print("숫자를 입력하세요.")

def extract_outermost_braces(s):
    start = None
    depth = 0

    for i, c in enumerate(s):
        if c == '{':
            if depth == 0:
                start = i
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0 and start is not None:
                return s[start:i+1]  # 중괄호 전체 포함해서 반환

    return None  # 중괄호 쌍이 없거나 올바르지 않음

def get_passengers(nbt_str):
    match = re.search(r'Passengers\s*:\s*\[(.*)](?=[,}])', nbt_str, re.DOTALL)
    if not match:
        return []

    inner = match.group(1)

    results = []
    depth = 0
    current = ''
    in_string = False
    i = 0
    while i < len(inner):
        c = inner[i]

        if c == '"' and (i == 0 or inner[i-1] != '\\'):
            in_string = not in_string

        if not in_string:
            if c == '{':
                if depth == 0:
                    current = ''
                depth += 1
            if depth > 0:
                current += c
            if c == '}':
                depth -= 1
                if depth == 0:
                    results.append(current.strip().replace(" ", ""))
        else:
            if depth > 0:
                current += c
        i += 1

    return results

def remove_passengers_tag(nbt_str):
    i = 0
    while i < len(nbt_str):
        if nbt_str[i:i+10] == 'Passengers':
            j = i + 10
            while j < len(nbt_str) and nbt_str[j] in ' \t\r\n:':
                j += 1
            if j < len(nbt_str) and nbt_str[j] == '[':
                # 대괄호 블록 찾기
                start = j
                depth = 1
                j += 1
                while j < len(nbt_str) and depth > 0:
                    if nbt_str[j] == '[':
                        depth += 1
                    elif nbt_str[j] == ']':
                        depth -= 1
                    j += 1
                end = j

                # 콤마까지 같이 제거
                after = end
                while after < len(nbt_str) and nbt_str[after] in ' \t\r\n':
                    after += 1
                if after < len(nbt_str) and nbt_str[after] == ',':
                    end = after + 1

                return nbt_str[:i] + nbt_str[end:]  # 제거 완료
        i += 1
    return nbt_str  # Passengers 없으면 원본 그대로

def has_tag(nbt, tag, numeric_tag = -1):
    is_find = False
    tags_match = re.search(r'Tags:\[([^\]]*)\]', nbt)

    if tags_match:
        tags = tags_match.group(1).split(",")
        for i in tags:
            if i.strip('"') == tag:
                is_find = True

        for i in tags:
            if is_find and numeric_tag != -1 and i.strip('"').isdigit():
                if i.strip('"') == numeric_tag:
                    return True
                
    if numeric_tag == -1: return is_find
    return False

def get_numeric_tag(nbt):
    tags_match = re.search(r'Tags:\[([^\]]*)\]', nbt)

    if tags_match:
        tags = tags_match.group(1).split(",")
        for i in tags:
            if i.strip('"').isdigit(): return i.strip('"')

def get_transform(nbt):
    transform_match = re.search(r'transformation:\[([^\]]*)\]', nbt)

    if transform_match:
        transform = transform_match.group(1)
        return transform

input("모든 .mcfunction의 변신부스터를 압축해 result 폴더에 저장합니다.\n진행하려면 아무 글자나 입력하세요.\n")

input_dir = "./"
output_dir = "./result/"
os.makedirs(output_dir, exist_ok=True)

files = [f for f in os.listdir(input_dir) if f.endswith(".mcfunction")]

for file_path in files:
    file_name = file_path.replace(".mcfunction", "")

    with open(file_path, 'rb') as f:
        data_data = f.read().decode('utf-8')

    count = len(re.findall(r'Passengers\s*:', data_data))
    if count != 1:
        print(file_name + "는 명령어가 여러 줄이므로 건너뜁니다.")
        continue

    if "boost-transform" in data_data:
        print(file_name + "는 이미 압축되었으므로 건너뜁니다.")
        continue

    if "kart-boost-move" not in data_data:
        print(file_name + "에는 변신부스터가 없으므로 건너뜁니다.")
        continue

    passengers = get_passengers(data_data)
    remove_passengers = remove_passengers_tag(extract_outermost_braces(data_data))
    new_passengers = []
    final_passengers = []

    #mid에 데이터 저장
    for i in passengers:
        i = i[1:-1]
        if has_tag(i, "kart-boost-move-start"):
            numeric_tag = get_numeric_tag(i)
            
            found_end = False
            end_transform = ""
            for j in passengers:
                if has_tag(j, "kart-boost-move-end", numeric_tag):
                    end_transform = get_transform(j)
                    found_end = True

            start_transform_data = "boost-transform-start:[" +  get_transform(i)  + "]"
            end_transform_data = "boost-transform-end:[" + end_transform + "]"

            #data 새로 쓰기
            data_match = re.search(r'data:\{([^}]*)\}', i)

            if found_end:
                if data_match: nbt_data = data_match.group(1) + "," + start_transform_data + "," + end_transform_data
                else: nbt_data = start_transform_data + "," + end_transform_data
            else:
                if data_match: nbt_data = data_match.group(1) + "," + start_transform_data
                else: nbt_data = start_transform_data

            i = re.sub(r'data:\{.*?\},\s*', '', i)
            i += ",data:{" + nbt_data + "}"
        
        new_passengers.append("{" + i + "}")

    #end 삭제
    for i in new_passengers:
        if not has_tag(i, "kart-boost-move-end"):
            final_passengers.append(i)

    result = "summon block_display ~ ~ ~ " + remove_passengers[0:-1] + ",Passengers:[" + ",".join(final_passengers) + "]}"
    result = result.replace("{,Passengers", "{Passengers")

    with open("result/" + file_name + ".mcfunction", "w", encoding="utf-8") as file:
        file.write(result)

    print(file_name + " 압축 완료")