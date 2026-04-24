import React from "https://esm.sh/react@18.3.1";
import { createRoot } from "https://esm.sh/react-dom@18.3.1/client";
import "./styles.css";

const exhibitions = [
  {
    title: "登月时代",
    subtitle: "1961 - 1972",
    description:
      "从阿波罗计划到月面采样，见证人类第一次把足迹留在地外天体，也看见工程协同如何改写文明边界。",
    highlight: "阿波罗 11 号任务轨迹全景",
  },
  {
    title: "空间站生活",
    subtitle: "1971 - 至今",
    description:
      "从礼炮号、和平号到国际空间站，长期驻留实验让我们真正开始理解失重中的人体、材料与生态循环。",
    highlight: "舱内一日作息与补给链路模拟",
  },
  {
    title: "火星计划",
    subtitle: "1997 - 未来",
    description:
      "探索车、轨道器与样本返回任务持续推进，人类正从遥感观察迈向可持续登陆与基地构想。",
    highlight: "火星地表任务窗口可视化",
  },
  {
    title: "深空探索",
    subtitle: "1977 - 未来",
    description:
      "旅行者号、詹姆斯韦布与行星际探测器不断延伸我们的感知半径，把太阳系外的未知搬进现实讨论。",
    highlight: "太阳系边界与星际介质交互展墙",
  },
];

const timeline = [
  {
    year: "1957",
    title: "斯普特尼克 1 号发射",
    detail: "人类第一颗人造卫星进入轨道，正式开启太空时代。",
  },
  {
    year: "1961",
    title: "加加林进入太空",
    detail: "首次载人太空飞行完成，验证人类可在轨道环境中生存。",
  },
  {
    year: "1969",
    title: "阿波罗 11 号登月",
    detail: "“一小步”成为跨时代的象征，地月探索进入新阶段。",
  },
  {
    year: "1971",
    title: "首座空间站投入使用",
    detail: "长期在轨驻留成为可能，空间科学实验迈向持续化。",
  },
  {
    year: "1998",
    title: "国际空间站组装启动",
    detail: "多国协作的航天工程落地，形成长期科研平台。",
  },
  {
    year: "2021",
    title: "詹姆斯韦布进入部署轨道",
    detail: "红外观测能力跃升，宇宙早期结构研究获得关键窗口。",
  },
  {
    year: "2030+",
    title: "载人深空任务预备期",
    detail: "围绕月面基地、火星登陆与深空推进系统持续验证。",
  },
];

function App() {
  return (
    <div className="page-shell">
      <div className="starfield" aria-hidden="true" />

      <header className="hero" id="top">
        <p className="eyebrow">SPACE EXPLORATION MUSEUM</p>
        <h1>太空探索博物馆</h1>
        <p className="hero-copy">
          一次沉浸式线上展览，沿着人类最大胆的航线回望过去，也凝视下一段尚未命名的星图。
        </p>
        <a className="hero-link" href="#visit">
          进入展览航线
        </a>
      </header>

      <main>
        <section className="section exhibitions" aria-labelledby="exhibit-title">
          <div className="section-head">
            <p>核心展厅</p>
            <h2 id="exhibit-title">四段改变文明方向的太空叙事</h2>
          </div>
          <div className="exhibit-grid">
            {exhibitions.map((item) => (
              <article className="exhibit-card" key={item.title}>
                <p className="card-subtitle">{item.subtitle}</p>
                <h3>{item.title}</h3>
                <p>{item.description}</p>
                <span>{item.highlight}</span>
              </article>
            ))}
          </div>
        </section>

        <section className="section timeline" aria-labelledby="timeline-title">
          <div className="section-head">
            <p>探索大事记</p>
            <h2 id="timeline-title">人类向太空迈进的关键节点</h2>
          </div>
          <ol>
            {timeline.map((node) => (
              <li key={`${node.year}-${node.title}`}>
                <div className="timeline-node" aria-hidden="true" />
                <div className="timeline-card">
                  <p className="year">{node.year}</p>
                  <h3>{node.title}</h3>
                  <p>{node.detail}</p>
                </div>
              </li>
            ))}
          </ol>
        </section>

        <section className="section cta" id="visit" aria-labelledby="visit-title">
          <p>参观预约</p>
          <h2 id="visit-title">预订你的下一次离轨旅程</h2>
          <p>
            预约后可获得专属导览路线、语音讲解包与每月“深空讲座”线上席位。
          </p>
          <button type="button">立即预约参观</button>
        </section>
      </main>

      <footer>
        <p>太空探索博物馆 · Space Exploration Museum</p>
        <a href="#top">返回顶部</a>
      </footer>
    </div>
  );
}

createRoot(document.getElementById("root")).render(<App />);
