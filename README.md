Fast, secure, and privacy-respecting public DNS resolver hosted in **India**,
exposing only encrypted DNS protocols with zero client data retention, QNAME minimization,
no EDNS Client Subnet and integrated blocking for ads, trackers, and malware.
~~At present, there's only a single node in Mumbai, with a second node in Bangalore planned.~~
Now the resolver runs on two fully active nodes in Mumbai and Singapore, ensuring 100% availability.

## 🌐 Resolver Endpoints

| Protocol | Host                              | Port(s)     |
| -------- | --------------------------------- | ----------- |
| **DoT**  | `dns.nutana.me`                   | **853/tcp** |
| **DoQ**  | `dns.nutana.me`                   | **853/udp** |
| **DoH**  | `https://dns.nutana.me/dns-query` | **443/tcp** |
| **DoH3** | `https://dns.nutana.me/dns-query` | **443/udp** |

## 🔐 Privacy Policy

This is a **personal project**, built to provide a simple, private, and encrypted DNS option for users in India.
Since the service currently runs from a single location, there may be occasional, rare downtimes.
I am planning to add a second location as soon as possible to improve redundancy and performance.

* **I do not log any personal data**.
* All configuration files used for this resolver are **public and open for review** in this GitHub repository.
* If you find anything that can be improved, **please open an issue.**

## 🙏 Thank You

A huge thank you to these amazing projects that make this resolver possible:

* **Knot Resolver** - open-­source and highly efficient resolver.
* **dnsdist** - a highly DNS-, DoS- and abuse-aware loadbalancer.
* **Hagezi DNS Filters** - high-quality and community-driven blocklists.

---
