# 구성 전 유의 사항

### 1. 가상머신 올리기
---
> Vagrantfile 위치에서 `vagrant up {VM_DEFINE_NAME}`

### 2. 가상 머신 설치 후 SSH 파일 수정
---
> - `vi /etc/ssh/sshd_config` 입력
> - port 22, passwordAuthentication yes 포트는 외부에서 통신이 가능하도록 22번을 열어두고, 다른 VM에서 비밀번호로 접속이 가능하도록 설정한다.
> - `systemctl restart sshd` SSH 를 재시작

### 3. 이슈 사항
---
> - worker node의 cpu를 기존 파일에서와 같이 1로 설정할 경우 오류가 남. -> cpu를 2로 수정
> - 기존 OS 이미지로 VM을 구성할 경우 NAT 구성에서 오류가 나기 때문에 CentOS 7 이미지로 구성
> - kubernetes 버전 변경 -> 1.22 이상의 경우 docker를 지원하지 않아서 다음과 같은 오류가 발견 됨.
``` 
  [preflight] Running pre-flight checks

  [WARNING SystemVerification]: missing optional cgroups: hugetlb error execution phase preflight: [preflight] Some fatal errors occurred:

  [ERROR CRI]: container runtime is not running: output: time="2022-07-11T10:15:54Z" level=fatal msg="unable to determine runtime API version: rpc error: code = Unavailable desc = connection error: desc = "transport: Error while dialing dial unix /var/run/containerd/containerd.sock: connect: no such file or directory"" , error: exit status 1

  [preflight] If you know what you are doing, you can make a check non-fatal with '--ignore-preflight-errors=...'

  To see the stack trace of this error execute with --v=5 or higher 
```

### 4.책에서 누락 된 내용
> pod 단일 배포 시 다음 확인
> - kubectl describe pod ${pod-name}
> - kubectl describe node m-k8s |grep Taints
> - kubectl taint nodes m-k8s node-role.kubernetes.io/master-
  







