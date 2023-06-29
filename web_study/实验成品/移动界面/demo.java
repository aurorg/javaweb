{
    private Fragment Fragment_config=new Fragment_config();
    private Fragment Fragment_contact=new Fragment_contact();
    private Fragment Fragment_wechat=new Fragment_wechat();
    private Fragment Fragment_friend=new Fragment_friend();
    private FragmentManager fragmentManager;
    private LinearLayout linearLayout1,linearLayout2,linearLayout3,linearLayout4;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        linearLayout1=findViewById(R.id.linearLayout1);
        linearLayout2=findViewById(R.id.linearLayout2);
        linearLayout3=findViewById(R.id.linearLayout3);
        linearLayout4=findViewById(R.id.linearLayout4);

        linearLayout1.setOnClickListener(this);
        linearLayout2.setOnClickListener(this);
        linearLayout3.setOnClickListener(this);
        linearLayout4.setOnClickListener(this);

        initFragment();
    }

    private void initFragment(){
        fragmentManager=getFragmentManager();
        FragmentTransaction transaction=fragmentManager.beginTransaction();
        transaction.add(R.id.id_content,Fragment_wechat);
        transaction.add(R.id.id_content,Fragment_contact);
        transaction.add(R.id.id_content,Fragment_config);
        transaction.add(R.id.id_content,Fragment_friend);
        transaction.commit();
    }


    private void hideFragment(FragmentTransaction transaction){
        transaction.hide(Fragment_wechat);
        transaction.hide(Fragment_contact);
        transaction.hide(Fragment_config);
        transaction.hide(Fragment_friend);
    }
    private void background(View v) {
        switch (v.getId()) {
            case R.id.linearLayout1:
                linearLayout1.setBackgroundColor(Color.parseColor("#426F42"));
                break;
            case R.id.linearLayout2:
                linearLayout2.setBackgroundColor(Color.parseColor("#426F42"));
                break;
            case R.id.linearLayout3:
                linearLayout3.setBackgroundColor(Color.parseColor("#426F42"));
                break;
            case R.id.linearLayout4:
                linearLayout4.setBackgroundColor(Color.parseColor("#426F42"));
                break;
            default:
                break;
        }
    }

    private void backgroundreturn(View v) {
        switch (v.getId()) {
            case R.id.linearLayout1:
                linearLayout1.setBackgroundColor(Color.parseColor("#000000"));
                break;
            case R.id.linearLayout2:
                linearLayout2.setBackgroundColor(Color.parseColor("#000000"));
                break;
            case R.id.linearLayout3:
                linearLayout3.setBackgroundColor(Color.parseColor("#000000"));
                break;
            case R.id.linearLayout4:
                linearLayout4.setBackgroundColor(Color.parseColor("#000000"));
                break;
            default:
                break;
        }
    }

    private void showfragmnet(int i) {

        FragmentTransaction transaction=fragmentManager.beginTransaction();
        hideFragment(transaction);
        switch (i){
            case 0:
                transaction.show(Fragment_wechat);
                background(linearLayout1);
                backgroundreturn(linearLayout3);
                backgroundreturn(linearLayout2);
                backgroundreturn(linearLayout4);
                break;
            case 1:
                transaction.show(Fragment_friend);
                background(linearLayout2);
                backgroundreturn(linearLayout4);
                backgroundreturn(linearLayout1);
                backgroundreturn(linearLayout3);
                break;
            case 2:
                transaction.show(Fragment_contact);
                background(linearLayout3);
                backgroundreturn(linearLayout4);
                backgroundreturn(linearLayout2);
                backgroundreturn(linearLayout1);
                break;
            case 3:
                transaction.show(Fragment_config);
                background(linearLayout4);
                backgroundreturn(linearLayout1);
                backgroundreturn(linearLayout2);
                backgroundreturn(linearLayout3);
                break;
            default:
                break;
        }
        transaction.commit();
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()){
            case R.id.linearLayout1:
                showfragmnet(0);
                break;
            case R.id.linearLayout2:
                showfragmnet(1);
                break;
            case R.id.linearLayout3:
                showfragmnet(2);
                break;
            case R.id.linearLayout4:
                showfragmnet(3);
                break;
            default:
                break;
        }
    }



}