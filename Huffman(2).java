package test1;

import java.io.*;
import java.math.BigInteger;
import java.util.*;

interface Tree<E>{
    int nodeCount();
    int leafCount();
    Node creatTree(Map<Character,Integer> map);
    void prePrint();
    void prePrintWithCirculation();
    void inPrint();
    void inPrintWithCirculation();
    void postPrint();
    void postPrintWithCirculation();
    void seqPrint();
    int getHigh();
    Node searchNodeData(E data);
    int nodeCountInSeq(int seq);
    Node cloneTree();
    Node imageForTree();

    boolean checkNodeInTree(Node<E> data);
    boolean isCompleteTree(Node<E> root);
}
class  MyTree<E> implements Tree<E>{
    Node<E> root=new Node<>();
    MyTree (Map<Character,Integer> map){
        root=creatTree(map);
    }
    public boolean isCompleteTree(){
        return isCompleteTree(root);
    }
    public boolean isCompleteTree(Node<E> root){
        if(root==null)return true;
        if(getHigh(root.left)<getHigh(root.right))return false;
        return isCompleteTree(root.left)&&isCompleteTree(root.right);

    }
    public int nodeCount(){
        return nodeCount(root);
    }
    public int nodeCount(Node<E> root){
        if(root==null)return 0;
        return nodeCount(root.left)+nodeCount(root.right)+1;
    }
    public int leafCount(){
        return leafCount(root);
    }
    public int leafCount(Node<E> root){
        if(root.left==null&&root.right==null){//root is leaf
            return 1;
        }
        //root isn't leaf
        return leafCount(root.left)+leafCount(root.right);
    }
    public void prePrint(){
        prePrint(root);
    }
    public void prePrint(Node<E> root){
        if(root==null){
            return;
        }
        System.out.println(root.getC()+" "+root.getCode());

        prePrint(root.left);
        prePrint(root.right);

    }
    public void prePrintWithCirculation(){
        if(root==null)return ;
        Stack<Node<E>> stack=new Stack<>();
        stack.add(root);
        Node<E> current=root;
        while(!stack.isEmpty()){
            if(current!=null){
                System.out.println(current.getC()+" "+current.getCode());
                stack.add(current.right);
                current=current.left;
            }else{
                current=stack.pop();
            }
        }
    }
    public void inPrint(){
        inPrint(root);
    }
    public void inPrint(Node<E> root){
        if(root==null){
            return;
        }
        inPrint(root.left);
        System.out.println(root.getC()+" "+root.getCode());
        inPrint(root.right);
    }
    public void inPrintWithCirculation(){
        if(root==null)return ;
        Stack<Node<E>> stack=new Stack<>();
        stack.add(root);
        Node<E> current=root;
        while(!stack.isEmpty()){
            if(current==null){
                current=stack.pop();
                System.out.println(current.getC()+" "+current.getCode());
                current=current.right;
            }
            else{
                stack.add(current);
                current=current.left;
            }
        }
    }
    public void postPrint(){
        postPrint(root);
    }
    public void postPrint(Node<E> root){
        if(root==null){
            return;
        }
        postPrint(root.left);
        postPrint(root.right);
        System.out.println(root.getC()+" "+root.getCode());
    }
     public void postPrintWithCirculation(){
        if(root==null)return ;
        Stack<Node<E>> stack=new Stack<>();
        stack.add(root);
        stack.add(root);
        Node<E> current=root;
        while(!stack.isEmpty()){
            current=stack.pop();
            if(!stack.isEmpty()&&current==stack.peek()){
                if(current.right!=null){
                    stack.add(current.right);
                    stack.add(current.right);
                }
                if(current.left!=null){
                    stack.add(current.left);
                    stack.add(current.left);
                }
            }else{
                System.out.println(current.getC()+" "+current.getCode());
            }
        }
     }
    public void seqPrint(){
        seqPrint(root);
    }
    public void seqPrint(Node<E> root){
        if(root==null)return;
        Deque<Node> queue=new ArrayDeque<>();
        queue.addLast(root);
        int head=0;
        int tail=1;
        while(head<tail){
            if(Objects.requireNonNull(queue.peekFirst()).left!=null){
                queue.addLast(queue.peekFirst().left);
                tail++;
            }
            if(Objects.requireNonNull(queue.peekFirst()).right!=null){
                queue.addLast(queue.peekFirst().right);
                tail++;
            }
            System.out.println(queue.peekFirst().getC()+" "+queue.removeFirst().getCode());
            head++;
        }
    }
    public int getHigh(){
        return getHigh(root);
    }
    public int getHigh(Node<E> root){
        if(root==null)return 0;
        int m1=getHigh(root.left);
        int m2=getHigh(root.right);
        return 1+(m1>m2?m1:m2);
    }
    public Node cloneTree(){
        return cloneTree(root);
    }
    public Node cloneTree(Node<E> root){
        if(root==null)return null;
        Node<E> ans=new Node<>();
        ans.setWeight(root.getWeight());
        ans.setC(root.getC());
        ans.setCode(root.getCode());
        ans.left=cloneTree(root.left);
        ans.right=cloneTree(root.right);
        return root;
    }
    public Node searchNodeData(E data){
        return searchNodeData(root,data);
    }
    public Node searchNodeData(Node<E> root,E data){
        if(root==null)return null;
        if(root.getC()==data)return root;
        Node n1=searchNodeData(root.left,data);
        Node n2=searchNodeData(root.right,data);
        if(n1!=null)return n1;
        if(n2!=null)return n2;
        return null;
    }
    public int nodeCountInSeq(int seq){
        //return -1 is meaning not this seq
        //return 0 is meaning root is null
        if(seq>getHigh(root)||seq<0){
            return -1;
        }
        if(root==null)return 0;
        Deque<Node> queue=new ArrayDeque<>();
        queue.addLast(root);
        int head=0;
        int tail=1;
        int count=0;
        while(head<tail){
            count++;
            if(count==seq){
                return tail-head;
            }
            if(Objects.requireNonNull(queue.peekFirst()).left!=null){
                queue.addLast(queue.peekFirst().left);
                tail++;
            }
            if(Objects.requireNonNull(queue.peekFirst()).right!=null){
                queue.addLast(queue.peekFirst().right);
                tail++;
            }
            queue.removeFirst();
            head++;
        }
        return -1;
    }
    public Node<E> creatTree(Map<Character,Integer> map){
        LinkedList<Node> list=new LinkedList<>();
        for(Map.Entry<Character,Integer> e: map.entrySet()){
            Node<Character> node=new Node<>();
            node.setC(e.getKey());
            node.setWeight(e.getValue());
            node.left=null;
            node.right=null;
            list.add(node);
        }
        while(list.size()>0){
            Collections.sort(list);
            if(list.size()==1){
                return list.get(0);
            }else{
                Node node1=list.removeFirst();
                Node node2=list.removeFirst();
                Node<Character> node=new Node<>();
                node.setWeight(node1.getWeight()+node2.getWeight());
                node.setC(null);

                if(node1.getWeight()<node2.getWeight()){
                    node.left=node1;
                    node.right=node2;
                }else{
                    node.left=node2;
                    node.right=node1;
                }
                list.add(node);
            }
        }
        return null;
    }
    public Node<E> imageForTree(){
        return imageForTree(this.root);
    }
    public Node imageForTree(Node<E> root){
        if(this.root==null)return null;
        Node<E> temp=imageForTree(root.left);
        root.left=imageForTree(root.right);
        root.right=temp;
        return root;
    }
    public boolean checkNodeInTree(Node<E> data){
        return true;
    }
}
class Node<E> implements Comparable{

    private E c;
    private int weight;
    private String code="";
    Node<E> left;
    Node<E> right;
    public void setC(E c){
        this.c=c;
    }
    public void setWeight(int weight){
        this.weight=weight;
    }
    public void setCode(String c){
        code=code.concat(c);
    }
    public E getC(){
        return this.c;
    }
    public int getWeight(){
        return this.weight;
    }
    public String getCode(){
        return this.code;
    }
    public int compareTo(Object a){
        return this.getWeight()-((Node)a).getWeight();
    }
}
public class Huffman{
    static String src1="1.txt",src2="hfm1.dat",src3="restore.txt";
    public static void main(String... args)  throws IOException{
        checkExist(args);
        Map<Character,Integer> map=account();
        MyTree<Character> tree=new MyTree<>(map);
        tree.root =tree.creatTree(map);
        setCodeForTree(tree.root);
        Map<Character,String> map1=new HashMap<>();
        preCode(tree.root,map1);
        printToFile(map1);

        for(Map.Entry<Character,String> e:map1.entrySet()){
            System.out.println(e.getKey()+" "+e.getValue());
        }

        try{
            restoreTree(map1);
        }catch(ClassNotFoundException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    public static void checkExist(String... args)throws IOException{
        if(args.length>0){
            src1=args[0];
            src2=args[1];
            src3=args[2];
        }
        File file;
        file=new File(src2);
        if(!file.exists()){
            file.createNewFile();
        }
        file=new File(src3);
        if(!file.exists()){
            file.createNewFile();
        }
    }
    public static Map<Character,Integer> account() throws IOException{

        Scanner input=new Scanner(new FileInputStream(src1));

        Map<Character,Integer> map=new HashMap<>();
        while(input.hasNext()){
            String s=input.nextLine();
            if(input.hasNext()){
                s=s.concat("\n");
            }
            for(Character e: s.toCharArray()){
                if(map.get(e)==null){
                    map.put(e,1);
                }else{
                    map.put(e,map.get(e)+1);
                }
            }
        }
        return map;
    }
    public static void setCodeForTree(Node<Character> root){
        Node p=root;
        Deque<Node> deque=new LinkedList<>();
        deque.offer(p);
        while(deque.size()>0){
            p=deque.poll();
            if(p.left!=null){
                p.left.setCode(p.getCode()+"0");
                deque.offer(p.left);
            }
            if(p.right!=null){
                p.right.setCode(p.getCode()+"1");
                deque.offer(p.right);
            }
        }
    }
    public static void preCode(Node root,Map<Character,String> map){
        if(root==null){
            return ;
        }
        if(root.getC()!=null){
            map.put((Character) root.getC(),root.getCode());
        }
        preCode(root.left,map);
        preCode(root.right,map);
    }
    public static void inCode(Node root,Map<Character,String> map){
        if(root==null){
            return ;
        }
        inCode(root.left,map);
        if(root.getC()!=null){
            map.put((Character) root.getC(),root.getCode());
        }
        inCode(root.right,map);
    }
    public static void postCode(Node root,Map<Character,String> map){
        if(root==null){
            return ;
        }
        postCode(root.left,map);
        postCode(root.right,map);
        if(root.getC()!=null){
            map.put((Character) root.getC(),root.getCode());
        }
    }
    public static void printToFile(Map<Character,String> map)throws IOException{
        Scanner input=new Scanner(new FileInputStream(src1));
        ObjectOutputStream output=new ObjectOutputStream(new FileOutputStream(src2));

        String numCode="";
        while(input.hasNext()){
            String s=input.nextLine();
            if(input.hasNext())s=s.concat("\n");
            for(char e: s.toCharArray()){
                numCode=numCode.concat(map.get(e));
            }
        }
        int i=0,count=0;
        while(numCode.charAt(i++)=='0'){
            count++;
        }
        output.write(count);

        output.writeObject(map);

        BigInteger code=new BigInteger("0");
        for(char e: numCode.toCharArray()){
            if(e=='0'){
                code=code.or(new BigInteger("0"));
            }else{
                code=code.or(new BigInteger("1"));
            }
            code=code.shiftLeft(1);
        }
        code=code.shiftRight(1);
        output.writeObject(code);
        output.close();
    }
    public static void restoreTree(Map<Character,String> map) throws IOException, ClassNotFoundException {
        Map<Character,String> map1=new TreeMap<>();
        ObjectInputStream input=new ObjectInputStream(new FileInputStream(src2));

        int count=input.read();
        String s="";
        for(int i=0;i<count;i++)
            s=s.concat("0");

        map1=(Map<Character, String>)input.readObject();

        FileOutputStream output=new FileOutputStream(src3);
        BigInteger code=(BigInteger) input.readObject();
        s=s.concat(code.toString(2));
        int len=s.length();

        for(int i=0;i<len;i++){
            for(int L=1;L<=len/2+1;L++){
                int j=L+i;
                if(j>len)break;
                String sub=s.substring(i,j);
                for(Map.Entry<Character,String> e: map.entrySet()){
                    if(sub.equals(e.getValue())){
                        output.write(e.getKey());
                        i+=L;
                        L=0;
                    }
                }
            }
        }
        output.close();
    }
}